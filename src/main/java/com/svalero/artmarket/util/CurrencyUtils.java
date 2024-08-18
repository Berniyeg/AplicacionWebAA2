package com.svalero.artmarket.util;

import java.text.NumberFormat;
import java.text.ParseException;
import java.util.Locale;

public class CurrencyUtils {

    public static String format(float value) {
        NumberFormat numberFormat = NumberFormat.getCurrencyInstance(new Locale("es", "ES"));
        return numberFormat.format(value);
    }

    public static float parse(String value) throws ParseException {
        NumberFormat numberFormat = NumberFormat.getInstance(new Locale("es", "ES"));
        return numberFormat.parse(value).floatValue();
    }
}
