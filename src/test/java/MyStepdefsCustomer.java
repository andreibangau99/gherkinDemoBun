//import io.cucumber.java.After;
//import io.cucumber.java.PendingException;
//import io.cucumber.java.de.Angenommen;
//import io.cucumber.java.de.Dann;
//import io.cucumber.java.de.Wenn;
//import io.cucumber.java.en.And;
//import io.cucumber.java.en.Given;
//import io.cucumber.java.en.Then;
//import io.cucumber.java.en.When;
//import io.cucumber.java.gl.Cando;
//import io.cucumber.java.gl.Dado;
//import org.junit.Assert;
//import org.junit.Assume;
//
//import static org.hamcrest.MatcherAssert.assertThat;
//import static org.junit.Assert.assertEquals;
//import static org.junit.Assert.assertTrue;
//
//public class MyStepdefsCustomer {
//
//
//
//    @Given("an account of type {string},client {string}, UPCCode3 {string} and delinquent between {string} {string} days with account conditions")
//    public void an_account_of_type_client_upc_code3_and_delinquent_between_days_with_account_conditions(String string, String string2, String string3, String string4, String string5, io.cucumber.datatable.DataTable dataTable) {
//        // Write code here that turns the phrase above into concrete actions
//        // For automatic transformation, change DataTable to one of
//        // E, List<E>, List<List<E>>, List<Map<K,V>>, Map<K,V> or
//        // Map<K, List<V>>. E,K,V must be a String, Integer, Float,
//        // Double, Byte, Short, Long, BigInteger or BigDecimal.
//        //
//        // For other transformations you can register a DataTableType.
//        throw new io.cucumber.java.PendingException();
//    }
//
//    @When("a payment method with bank account type {string}, bank account number & bank routing number is added using channel {string}")
//    public void a_payment_method_with_bank_account_type_bank_account_number_bank_routing_number_is_added_using_channel(String string, String string2) {
//        // Write code here that turns the phrase above into concrete actions
//        throw new io.cucumber.java.PendingException();
//    }
//    @When("making a one-time payment with payment amount {string} and payment date {string} using channel {string}")
//    public void making_a_one_time_payment_with_payment_amount_and_payment_date_using_channel(String string, String string2, String string3) {
//        // Write code here that turns the phrase above into concrete actions
//        throw new io.cucumber.java.PendingException();
//    }
//    @Then("API response code should be {string} with payment confirmation number in response")
//    public void api_response_code_should_be_with_payment_confirmation_number_in_response(String string) {
//        // Write code here that turns the phrase above into concrete actions
//        throw new io.cucumber.java.PendingException();
//    }
//    @Then("payment confirmation number should be added in DB with payment status scheduled")
//    public void payment_confirmation_number_should_be_added_in_db_with_payment_status_scheduled() {
//        // Write code here that turns the phrase above into concrete actions
//        throw new io.cucumber.java.PendingException();
//    }
//    @Then("payment amount {string},payment date {string}, created by channel {string} should be added in DB")
//    public void payment_amount_payment_date_created_by_channel_should_be_added_in_db(String string, String string2, String string3) {
//        // Write code here that turns the phrase above into concrete actions
//        throw new io.cucumber.java.PendingException();
//    }
//    @Then("Memo is sent successfully when payment scheduled via digital channel")
//    public void memo_is_sent_successfully_when_payment_scheduled_via_digital_channel() {
//        // Write code here that turns the phrase above into concrete actions
//        throw new io.cucumber.java.PendingException();
//    }
//    @Then("Delinquent Memo is sent successfully when payment scheduled via digital channel")
//    public void delinquent_memo_is_sent_successfully_when_payment_scheduled_via_digital_channel() {
//        // Write code here that turns the phrase above into concrete actions
//        throw new io.cucumber.java.PendingException();
//    }
//    @Then("Email is published successfully when payment scheduled via digital channel")
//    public void email_is_published_successfully_when_payment_scheduled_via_digital_channel() {
//        // Write code here that turns the phrase above into concrete actions
//        throw new io.cucumber.java.PendingException();
//    }
//    @Then("Open to buy should be updated")
//    public void open_to_buy_should_be_updated() {
//        // Write code here that turns the phrase above into concrete actions
//        throw new io.cucumber.java.PendingException();
//    }
//    @Then("Action entry should be updated")
//    public void action_entry_should_be_updated() {
//        // Write code here that turns the phrase above into concrete actions
//        throw new io.cucumber.java.PendingException();
//    }
//
//    @Given("an account of type {string},client {string} and delinquent between {string} {string} days with account conditions")
//    public void an_account_of_type_client_and_delinquent_between_days_with_account_conditions(String string, String string2, String string3, String string4, io.cucumber.datatable.DataTable dataTable) {
//        // Write code here that turns the phrase above into concrete actions
//        // For automatic transformation, change DataTable to one of
//        // E, List<E>, List<List<E>>, List<Map<K,V>>, Map<K,V> or
//        // Map<K, List<V>>. E,K,V must be a String, Integer, Float,
//        // Double, Byte, Short, Long, BigInteger or BigDecimal.
//        //
//        // For other transformations you can register a DataTableType.
//        throw new io.cucumber.java.PendingException();
//    }
//
//    @When("a one-time payment with payment amount {string} and payment date {string}")
//    public void a_one_time_payment_with_payment_amount_and_payment_date(String string, String string2) {
//        // Write code here that turns the phrase above into concrete actions
//        throw new io.cucumber.java.PendingException();
//    }
//    @When("making a one-time payment with bank account type {string}, bank account number & bank routing number in request using channel {string}")
//    public void making_a_one_time_payment_with_bank_account_type_bank_account_number_bank_routing_number_in_request_using_channel(String string, String string2) {
//        // Write code here that turns the phrase above into concrete actions
//        throw new io.cucumber.java.PendingException();
//    }
//
//    @Given("an account of type {string} and client {string} with account conditions")
//    public void an_account_of_type_and_client_with_account_conditions(String string, String string2, io.cucumber.datatable.DataTable dataTable) {
//        // Write code here that turns the phrase above into concrete actions
//        // For automatic transformation, change DataTable to one of
//        // E, List<E>, List<List<E>>, List<Map<K,V>>, Map<K,V> or
//        // Map<K, List<V>>. E,K,V must be a String, Integer, Float,
//        // Double, Byte, Short, Long, BigInteger or BigDecimal.
//        //
//        // For other transformations you can register a DataTableType.
//        throw new io.cucumber.java.PendingException();
//    }
//
//    @When("a one-time payment with payment amount {string} and payment date {string} for settlement")
//    public void a_one_time_payment_with_payment_amount_and_payment_date_for_settlement(String string, String string2) {
//        // Write code here that turns the phrase above into concrete actions
//        throw new io.cucumber.java.PendingException();
//    }
//
//
//}
