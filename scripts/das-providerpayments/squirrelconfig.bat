
rem call uncloakconfig.bat

mkdir c:\work\configs

mkdir c:\work\configs\SFA.DAS.CollectionEarnings.DataLock.IntTests
mkdir c:\work\configs\SFA.DAS.Provider.Events.DataLock.IntegrationTests
mkdir c:\work\configs\SFA.DAS.Provider.Events.Submission.IntegrationTests
mkdir c:\work\configs\SFA.DAS.ProviderPayments.Calc.LevyPayments.IntegrationTests
mkdir c:\work\configs\SFA.DAS.Payments.Calc.CoInvestedPayments.IntegrationTests
mkdir c:\work\configs\SFA.DAS.ProviderPayments.Calc.ManualAdjustments.IntegrationTests
mkdir c:\work\configs\SFA.DAS.ProviderPayments.Calc.PaymentsDue.IntegrationTests
mkdir c:\work\configs\SFA.DAS.Payments.Calc.ProviderAdjustments.IntegrationTests
mkdir c:\work\configs\SFA.DAS.Payments.Reference.Accounts.IntegrationTests
mkdir c:\work\configs\SFA.DAS.Payments.Reference.Commitments.IntegrationTests

mkdir c:\work\configs\SFA.DAS.Payments.AcceptanceTests


copy C:\git\das-providerpayments\src\SharedPipelineComponents\Datalock\SFA.DAS.CollectionEarnings.DataLock.IntTests\App.config c:\work\configs\SFA.DAS.CollectionEarnings.DataLock.IntTests
copy C:\git\das-providerpayments\src\SharedPipelineComponents\DataLockEvents\SFA.DAS.Provider.Events.DataLock.IntegrationTests\App.config c:\work\configs\SFA.DAS.Provider.Events.DataLock.IntegrationTests
copy C:\git\das-providerpayments\src\SharedPipelineComponents\IlrSubmissionEvents\SFA.DAS.Provider.Events.Submission.IntegrationTests\App.config c:\work\configs\SFA.DAS.Provider.Events.Submission.IntegrationTests
copy C:\git\das-providerpayments\src\PeriodEnd\LevyPayments\SFA.DAS.ProviderPayments.Calc.LevyPayments.IntegrationTests\App.config c:\work\configs\SFA.DAS.ProviderPayments.Calc.LevyPayments.IntegrationTests
copy C:\git\das-providerpayments\src\PeriodEnd\CoInvestedPayments\SFA.DAS.Payments.Calc.CoInvestedPayments.IntegrationTests\App.config c:\work\configs\SFA.DAS.Payments.Calc.CoInvestedPayments.IntegrationTests
copy C:\git\das-providerpayments\src\PeriodEnd\ManualAdjustments\SFA.DAS.ProviderPayments.Calc.ManualAdjustments.IntegrationTests\App.config c:\work\configs\SFA.DAS.ProviderPayments.Calc.ManualAdjustments.IntegrationTests
copy C:\git\das-providerpayments\src\PeriodEnd\PaymentsDue\SFA.DAS.ProviderPayments.Calc.PaymentsDue.IntegrationTests\App.config c:\work\configs\SFA.DAS.ProviderPayments.Calc.PaymentsDue.IntegrationTests
copy C:\git\das-providerpayments\src\PeriodEnd\ProviderAdjustments\SFA.DAS.Payments.Calc.ProviderAdjustments.IntegrationTests\App.config c:\work\configs\SFA.DAS.Payments.Calc.ProviderAdjustments.IntegrationTests
copy C:\git\das-providerpayments\src\Reference\Accounts\SFA.DAS.Payments.Reference.Accounts.IntegrationTests\App.config c:\work\configs\SFA.DAS.Payments.Reference.Accounts.IntegrationTests
copy C:\git\das-providerpayments\src\Reference\Commitments\SFA.DAS.Payments.Reference.Commitments.IntegrationTests\App.config c:\work\configs\SFA.DAS.Payments.Reference.Commitments.IntegrationTests

copy C:\git\das-providerpayments\src\AcceptanceTesting\SpecByExample\SFA.DAS.Payments.AcceptanceTests\App.config c:\work\configs\SFA.DAS.Payments.AcceptanceTests

