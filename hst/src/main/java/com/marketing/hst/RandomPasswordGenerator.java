package com.marketing.hst;
import java.security.SecureRandom;
import java.util.Random;

public class RandomPasswordGenerator {

    private static final String CHAR_LOWER = "abcdefghijklmnopqrstuvwxyz";
    private static final String CHAR_UPPER = CHAR_LOWER.toUpperCase();
    private static final String NUMBER = "0123456789";
    private static final String OTHER_CHAR = "!@#$%&*()_+-=[]|,./?><";

    private static final String PASSWORD_ALLOW_BASE = CHAR_LOWER + CHAR_UPPER + NUMBER + OTHER_CHAR;
    private static final SecureRandom random = new SecureRandom();

    /**
     * Generates a random password with specified length.
     *
     * @param length The length of the generated password.
     * @return A randomly generated password string.
     */
    public static String generateRandomPassword(int length) {
        if (length < 4) {
            throw new IllegalArgumentException("The password length must be at least 4 characters");
        }

        StringBuilder password = new StringBuilder(length);
        password.append(CHAR_LOWER.charAt(random.nextInt(CHAR_LOWER.length())));
        password.append(CHAR_UPPER.charAt(random.nextInt(CHAR_UPPER.length())));
        password.append(NUMBER.charAt(random.nextInt(NUMBER.length())));
        password.append(OTHER_CHAR.charAt(random.nextInt(OTHER_CHAR.length())));

        for (int i = 0; i < length - 4; i++) {
            password.append(PASSWORD_ALLOW_BASE.charAt(random.nextInt(PASSWORD_ALLOW_BASE.length())));
        }

        return shuffleString(password.toString());
    }

    /**
     * Shuffles the characters in a string using Fisher-Yates algorithm.
     *
     * @param string The string to be shuffled.
     * @return A shuffled string.
     */
    private static String shuffleString(String string) {
        char[] charArray = string.toCharArray();
        for (int i = charArray.length - 1; i > 0; i--) {
            int index = random.nextInt(i + 1);
            char temp = charArray[index];
            charArray[index] = charArray[i];
            charArray[i] = temp;
        }
        return new String(charArray);
    }

    public static void main(String[] args) {
        int passwordLength = 12; // Specify the desired length of the password
        try {
            String generatedPassword = generateRandomPassword(passwordLength);
            System.out.println("Generated Password: " + generatedPassword);
        } catch (IllegalArgumentException e) {
            System.out.println("Password length must be at least 4 characters");
        }
    }
}
