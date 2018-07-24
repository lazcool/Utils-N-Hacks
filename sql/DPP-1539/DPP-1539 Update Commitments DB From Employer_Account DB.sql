/*
Data script for DPP-1539: Consume & associate the Agreement ID against existing Commitments
Target: Employer_Account DB
Description: Generate update script to populate new AccountLegalEntityPublicHashedId column in Commitment table in Commitment DB
			 Run the generated sql against the Commitments DB
*/

select
    'update commitment set accountlegalentitypublichashedid = ''' + PublicHashedId + ''''
  + ' where employeraccountid = ' + convert(varchar, AccountId)
  + ' and legalentityid = '''+ convert(varchar, LegalEntityId) + ''''
from employer_account.AccountLegalEntity
where PublicHashedId is not null