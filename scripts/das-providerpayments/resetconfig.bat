
pushd C:\git\das-providerpayments

git checkout -- src\SharedPipelineComponents\Datalock\SFA.DAS.CollectionEarnings.DataLock.IntTests\App.Config
git checkout -- src\SharedPipelineComponents\DataLockEvents\SFA.DAS.Provider.Events.DataLock.IntegrationTests\App.Config
git checkout -- src\SharedPipelineComponents\IlrSubmissionEvents\SFA.DAS.Provider.Events.Submission.IntegrationTests\App.Config
git checkout -- src\PeriodEnd\LevyPayments\SFA.DAS.ProviderPayments.Calc.LevyPayments.IntegrationTests\App.Config
git checkout -- src\PeriodEnd\CoInvestedPayments\SFA.DAS.Payments.Calc.CoInvestedPayments.IntegrationTests\App.Config
git checkout -- src\PeriodEnd\ManualAdjustments\SFA.DAS.ProviderPayments.Calc.ManualAdjustments.IntegrationTests\App.Config
git checkout -- src\PeriodEnd\PaymentsDue\SFA.DAS.ProviderPayments.Calc.PaymentsDue.IntegrationTests\App.Config
git checkout -- src\PeriodEnd\ProviderAdjustments\SFA.DAS.Payments.Calc.ProviderAdjustments.IntegrationTests\App.Config
git checkout -- src\Reference\Accounts\SFA.DAS.Payments.Reference.Accounts.IntegrationTests\App.Config
git checkout -- src\Reference\Commitments\SFA.DAS.Payments.Reference.Commitments.IntegrationTests\App.Config

git checkout -- src\AcceptanceTesting\SpecByExample\SFA.DAS.Payments.AcceptanceTests\App.Config

popd
