package org.java3;

public class TestMailler {
    public static void main(String[] args) {
        System.out.println("Sent with code " + Mailer.sendEmail("h.thuy7605@gmail.com", "h.thuy7605@gmail.com", "Test mail", "Đây là mail để thử test"));
    }
}
