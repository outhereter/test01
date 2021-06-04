package outhereter.test01;

import static org.seasar.util.lang.StringUtil.isEmpty;
import static org.seasar.util.lang.StringUtil.isNotEmpty;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.regex.Pattern;

import org.apache.commons.lang.StringEscapeUtils;
import org.apache.commons.lang.StringUtils;

public class StringUtil {

    /** 半角英数字 */
    private static String PATTERN_HALFWIDTH_ALPHA_NUMERIC = "^[a-zA-Z0-9/:-@\\[-\\`\\{-\\~]+$";

    public static String join(String[] array, String with) {
        if (array == null) {
            return null;
        }

        StringBuilder builder = new StringBuilder();
        for (String s : array) {
            if (builder.length() > 0) {
                builder.append(with);
            }
            builder.append(s);
        }
        return builder.toString();
    }

    public static boolean isAllEmpty(Map<String, String> params) {
        if (params == null) {
            return true;
        }

        for (String key : params.keySet()) {
            if (isNotEmpty(params.get(key))) {
                return false;
            }
        }

        return true;
    }

    public static boolean isAllFilled(Map<String, String> params) {
        if (params == null) {
            return true;
        }

        for (String key : params.keySet()) {
            if (isEmpty(params.get(key))) {
                return false;
            }
        }

        return true;
    }

    public static boolean isSomeFilled(Map<String, String> params) {

        return !isAllEmpty(params) && !isAllFilled(params);
    }

    public static String[] getEmptyParams(Map<String, String> params) {
        List<String> ret = new ArrayList<>();
        if (params == null) {
            return (String[]) ret.toArray(new String[ret.size()]);
        }

        for (String key : params.keySet()) {
            if (isEmpty(params.get(key))) {
                ret.add(key);
            }
        }

        return (String[]) ret.toArray(new String[ret.size()]);
    }

    /**
     * ブランク文字列をNULLに変換。
     * 
     * @param str
     *            変換対象
     * @return　ブランク：NULL それ以外：そのまま返却。
     */
    public static String blankToNull(String str) {
        return StringUtils.isBlank(str) ? null : str;
    }

    /**
     * NULLをブランク文字列に変換。
     * 
     * @param src
     *            変換対象
     * @return NULL：ブランク それ以外：ストリング返却。
     */
    public static String nullToBlank(Object src) {
        return src == null ? "" : src.toString();
    }

    /**
     * NULLをブランク文字列に変換。
     * 
     * @param src
     *            変換対象
     * @return NULL：ブランク それ以外：そのまま返却。
     */
    public static String nullToBlank(String src) {
        return src == null ? "" : src;
    }

    /**
     * (全角・半角)スペース区切りで行を分割し、文字列配列を返す(最大10個)。
     * 
     * @param line 処理文字
     * 
     * @return 文字列配列
     */
    public static String[] splitLineWithSpace(String line) {
        // 分割後の文字列配列
        String[] result = new String[10];
        if (StringUtils.isBlank(line)) {
            return result;
        }
        String targetString = line;
        targetString = targetString.replaceAll("　", " ");
        targetString = targetString.trim();
        targetString = targetString.replaceAll(SPLITLINE_REPLACE_REGEX, SPLITLINE_SPLIT_STR);
        String[] splitStrArray = targetString.split(SPLITLINE_SPLIT_STR);
        int index = -1;
        for (String splitStr : splitStrArray) {
            index++;
            if (index > 9) {
                return result;
            }
            result[index] = splitStr;
        }

        return result;
    }

    private static final String SPLITLINE_REPLACE_REGEX = " {1,}";
    private static final String SPLITLINE_SPLIT_STR = "#&!#";

    /**
     * 半角英数字入力値をチェックします。
     * 
     * @param input 入力値
     * @param caption 項目名
     * @return boolean
     */
    public static boolean isHalfWidthAlphaNumeric(String value) {
        if (Pattern.matches(PATTERN_HALFWIDTH_ALPHA_NUMERIC, value)) {
            return true;
        }
        return false;
    }

    /**
     * HTML表示時に特殊文字を文字参照に置き換える
     * 
     * @param text 文字列
     * @return
     */
    public static String escapeHtml(String text) {
        return StringEscapeUtils.escapeHtml(text);
    }
}
