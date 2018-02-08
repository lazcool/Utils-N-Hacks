using System;
using System.Collections.Generic;
using System.Linq;
using System.IO;
using System.Threading.Tasks;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using Newtonsoft.Json;
using SFA.DAS.Provider.Events.Api.Client;
using SFA.DAS.Provider.Events.Api.Types;

namespace DAS_Utils
{
    [TestClass]
    public class UnitTest1
    {
        [TestMethod]
        public async Task TestMethod1()
        {
            const string apiBaseUrl = "https://beta-payments.apprenticeships.sfa.bis.gov.uk/";
            string clientToken = File.ReadAllText(@"C:\tokens\PaymentsEventsApi_PROD.txt");

            //use https://stackoverflow.com/questions/10667012/getting-downloads-folder-in-c?
            const string outputPath = @"C:\Users\phil\Downloads\";

            var config = new PaymentsEventsApiConfiguration { ApiBaseUrl = apiBaseUrl, ClientToken = clientToken };

            var client = new PaymentsEventsApiClient(config);

            //todo: could provide employeraccountid & prn to reduce volumes!

            //var sinceEventId = 1747413 - 1;

            //try azure db with and withoug mars
            //do web sites write to datalockstatus?
            //point to live? nah, db set up pain
            //recheck logs for exceptions - search by apprenticeshipid? when error occured?

            //could bring in SelectManyAsync
            //var datalockEvents = Data.SinceEventIds().SelectMany(async since => await client.GetDataLockEvents(since));

            var pageStartIds = Data.SinceEventIds(Data.Ids);

            Console.WriteLine("Page start ids:");
            Console.WriteLine(string.Join(",", pageStartIds.Select(i => i.ToString())));

            List<DataLockEvent> datalockEvents = new List<DataLockEvent>();
            foreach (var since in pageStartIds)
            {
                //                var page = await Retries.CallWithRetryAsync<PageOfResults<DataLockEvent>>(c => client.GetDataLockEvents(since));
                Console.WriteLine($"Fetching page @ {since}");
                var page = await Retries.CallWithRetryAsync(() => client.GetDataLockEvents(since));
                datalockEvents = datalockEvents.Concat(page.Items).Where(id => Data.Ids.Contains(id.Id)).ToList();
            }

            var path = outputPath + "1_payment_event.json";
            Console.WriteLine($"Generating {path}");

            var newPage = new PageOfResults<DataLockEvent> {Items = datalockEvents.ToArray(), PageNumber = 1, TotalNumberOfPages = 1};

            var pageJson = JsonConvert.SerializeObject(newPage);

            File.WriteAllText(path, pageJson);
        }

        [TestMethod]
        public void TestIdsPaging()
        {
            //var xxxxxx = Data.SinceEventIds(Data.Ids);

            var ids = new long[] { 1, 2, 125, 249, 250, 251, 499, 500, 501 };
            var expectedSinceEvendIds = new long[] { 0, 250, 500 };
            var actualSinceEvendIds = Data.SinceEventIds(ids);
            CollectionAssert.AreEqual(expectedSinceEvendIds, actualSinceEvendIds.ToList());
        }
    }

    public static class Data
    {
        public const int pageSize = 250;
        public const string IdsString = @"41801,          
41802,
73446,
77976,
79388,
83955,
251151,
255092,
277345,
327952,
331765,
625949,
816477,
818548,
841886,
851017,
862940,
874930,
893454,
915421,
922856,
1186563,
1215765,
1250439,
1507622,
1582364,
1629132,
1704221,
1747429,
50151,
73445,
77975,
79387,
83954,
251145,
255086,
277339,
327946,
331759,
625943,
816471,
818542,
841880,
851011,
862934,
874924,
893448,
915415,
922850,
1186557,
1215759,
1250433,
1507616,
1582358,
1629126,
1704215,
1747423,
816496,
816498,
841900,
841901,
862954,
862955,
893468,
893469,
922874,
922875,
1186551,
1215753,
1250427,
1507610,
1582352,
1629120,
1704209,
1747413,
1186535,
1215773,
1250411,
1507655,
1582341,
1629140,
1747461";

        public static List<long> Ids = IdsString.Split(',').Select(long.Parse).OrderBy(id => id).ToList();

        //todo: rewrite for simplicity?, or
        // https://codereview.stackexchange.com/questions/5648/any-way-to-make-this-recursive-function-better-faster/5661#5661
        // https://stackoverflow.com/questions/2055927/ienumerable-and-recursion-using-yield-return

        public static IEnumerable<long> SinceEventIds(IEnumerable<long> ids, int pageSize = 250)
        {
            if (!ids.Any())
                yield break;

            var firstId = ids.First();

            yield return firstId - 1;

            foreach (var id in SinceEventIds(ids.SkipWhile(id => id < firstId + pageSize)))
            {
                yield return id;
            }
        }
    }

    public static class Retries
    {
        public static async Task<TResult> CallWithRetryAsync<TResult>(Func<Task<TResult>> call, int attempts = 3)
        {
            while (attempts-- > 0)
            {
                try
                {
                    return await call();
                }
                catch (Exception e)
                {
                    Console.WriteLine(e);
                }
            }
            throw new Exception("Abandoning call");
        }
    }
}

