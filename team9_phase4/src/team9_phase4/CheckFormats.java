package team9_phase4;

import java.util.regex.Pattern;

public class CheckFormats {
	public boolean checkDateFormat(String bday) {
        // Date 형식 포맷 검사
        // https://coding-factory.tistory.com/529
        String bday_pattern = "^\\d{4}-\\d{2}-\\d{2}$";
        return Pattern.matches(bday_pattern, bday);
    }

	public String checkSex(String sex) {
        if (sex.equals("m") || sex.equals("M")
                || sex.equals("f") || sex.equals("F")) {
            return sex.toUpperCase();
        } else {
            return "null";
        }
    }

    public boolean checkPhoneFormat(String phone) {
        String phone_pattern = "^\\d{3}-\\d{4}$";
        return Pattern.matches(phone_pattern, phone);
    }
}
