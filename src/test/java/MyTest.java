import io.cucumber.junit.Cucumber;
import io.cucumber.junit.CucumberOptions;
import org.junit.runner.RunWith;

@RunWith(Cucumber.class)
//@CucumberOptions(plugin = "com.hpe.alm.octane.OctaneGherkinFormatter:gherkin-results/ManualRunnerTest_OctaneGherkinResults.xml",
//        features = "src/test/resources/F1/" , tags = "not @exclude")
@CucumberOptions(features = "src/test/resources/F1/Approve_35002.feature",
//        glue = {"MyStepdefs"},
        plugin = { "junit:target/cucumber-reports.xml" },tags = "not @exclude")

public class MyTest {

}