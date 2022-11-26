import static org.junit.Assert.*;
import org.junit.*;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;


class checker implements StringChecker{
  public boolean checkString(String s){
    if(s.contains("a")){
      return true;
    }
    else{
      return false;
    }
  }
}

public class TestListExamples {
  // Write your grading tests here!
  @Test
  public void testFilter(){
    List <String> input = Arrays.asList("Candy", "Cindy", "apple", "pencil");
    List <String> output = Arrays.asList("Candy", "apple");
    assertEquals(output, ListExamples.filter(input, new checker()));

  }
}
