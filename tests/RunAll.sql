set echo off
set feedback off
set verify off
Clear Screen
set linesize 5000
set pagesize 0
set serveroutput on size unlimited format truncated
@@lib/RunVars.sql

--Global setup
@@helpers/ut_example_tests.pks
@@helpers/ut_example_tests.pkb

--Tests to invoke
@@lib/RunTest.sql ut_test/ut_test.OwnerNameInvalid.sql
@@lib/RunTest.sql ut_test/ut_test.OwnerNameNull.sql
@@lib/RunTest.sql ut_test/ut_test.PackageInInvalidState.sql
@@lib/RunTest.sql ut_test/ut_test.PackageNameInvalid.sql
@@lib/RunTest.sql ut_test/ut_test.PackageNameNull.sql
@@lib/RunTest.sql ut_test/ut_test.ProcedureNameInvalid.sql
@@lib/RunTest.sql ut_test/ut_test.ProcedureNameNull.sql
@@lib/RunTest.sql ut_test/ut_test.SetupExecutedBeforeTest.sql
@@lib/RunTest.sql ut_test/ut_test.SetupProcedureNameInvalid.sql
@@lib/RunTest.sql ut_test/ut_test.SetupProcedureNameNull.sql
@@lib/RunTest.sql ut_test/ut_test.TeardownExecutedAfterTest.sql
@@lib/RunTest.sql ut_test/ut_test.TeardownProcedureNameInvalid.sql
@@lib/RunTest.sql ut_test/ut_test.TeardownProcedureNameNull.sql
@@lib/RunTest.sql ut_utils/ut_utils.test_result_to_char.RunsWithInvalidValues.sql
@@lib/RunTest.sql ut_utils/ut_utils.test_result_to_char.RunsWithNullValue.sql
@@lib/RunTest.sql ut_utils/ut_utils.test_result_to_char.Success.sql

@@lib/RunTest.sql ut_metadata/ut_metadata.form_name.TrimStandaloneProgramName.sql

@@lib/RunTest.sql ut_assert/ut_assert.are_equal.number.GivesSuccessForEqualValues.sql
@@lib/RunTest.sql ut_assert/ut_assert.are_equal.number.GivesFailureForDifferentValues.sql
@@lib/RunTest.sql ut_assert/ut_assert.are_equal.number.GivesFailureWhenActualIsNull.sql
@@lib/RunTest.sql ut_assert/ut_assert.are_equal.number.GivesFailureWhenBothAreNull.sql
@@lib/RunTest.sql ut_assert/ut_assert.are_equal.number.GivesFailureWhenExpectedIsNull.sql

@@lib/RunTest.sql ut_assert/ut_assert.are_equal.anydata.GivesSuccessWhenComparingTheSameData.sql
@@lib/RunTest.sql ut_assert/ut_assert.are_equal.anydata.GivesFailureWhenComparingDifferentData.sql
@@lib/RunTest.sql ut_assert/ut_assert.are_equal.anydata.PutsObjectStrucureIntoMessage.sql
@@lib/RunTest.sql ut_assert/ut_assert.are_equal.cursor.GivesFailureWhenComparingDifferentResultSets.sql
@@lib/RunTest.sql ut_assert/ut_assert.are_equal.cursor.GivesSuccessWhenComparingIdenticalResultSets.sql
--Global cleanup
drop package ut_example_tests;

--Finally
@@lib/RunSummary
--can be used by CI to check for tests status
exit :failures_count
