package features.runnerFiles;

import com.intuit.karate.cucumber.CucumberRunner;
import com.intuit.karate.cucumber.KarateStats;
import cucumber.api.CucumberOptions;
import org.junit.Test;
import static org.junit.Assert.*;

@CucumberOptions(features = "classpath:features/", tags = "~@ignore")
public class ParallelTest {

    @Test
    public void testParallel() {
        KarateStats stats = CucumberRunner.parallel(getClass(), 1, "target/surefire-reports");
    }
}
