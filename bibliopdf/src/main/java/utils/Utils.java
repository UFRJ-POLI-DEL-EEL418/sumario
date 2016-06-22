package utils;

import java.text.Normalizer;

public class Utils {
//------------------------------------------------------------------------------    
    public static String removeDiacriticals(String input) {
        if (input == null || input.equals("")) return input;
        input = input.toUpperCase();
        final String decomposed = Normalizer.normalize(input, Normalizer.Form.NFD);
        String final2 = decomposed.replaceAll("\\p{InCombiningDiacriticalMarks}+", "");
        final2 = final2.replace("'", " ");
        final2 = final2.replace("´", " ");
        final2 = final2.replace("-", " ");
        final2 = final2.replace(":", "");
        return final2;
    }
//------------------------------------------------------------------------------    
}
