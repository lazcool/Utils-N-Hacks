
rem call uncloakconfig.bat

mkdir c:\work\configs\das-commitements

mkdir c:\work\configs\das-commitments\SFA.DAS.Commitments.AddEpaToApprenticeships.WebJob
mkdir c:\work\configs\das-commitments\SFA.DAS.CommitmentPayments.WebJob
mkdir c:\work\configs\das-commitments\SFA.DAS.Commitments.AcademicYearEndProcessor.WebJob

copy C:\git\das-commitments\src\SFA.DAS.Commitments.AddEpaToApprenticeships.WebJob\App.config C:\work\configs\SFA.DAS.Commitments.AddEpaToApprenticeships.WebJob
copy C:\git\das-commitments\src\SFA.DAS.CommitmentPayments.WebJob\App.config c:\work\configs\SFA.DAS.CommitmentPayments.WebJob
copy C:\git\das-commitments\src\SFA.DAS.Commitments.AcademicYearEndProcessor.WebJob\App.config c:\work\configs\SFA.DAS.Commitments.AcademicYearEndProcessor.WebJob
