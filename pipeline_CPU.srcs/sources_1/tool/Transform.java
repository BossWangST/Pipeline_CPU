import java.io.*;
import java.util.*;

public class Transform {
    public static ArrayList<Byte> getInst(BufferedInputStream s) throws IOException {
        byte[] buffer = new byte[1];
        var list = new ArrayList<Byte>();
        int length;
        String inst_2;
        String inst_16;
        while ((length = s.read(buffer)) != -1) {
            list.add(buffer[0]);
        }
        // System.out.println(list.toString());
        return list;
    }

    public static String[] toHex(int[] list) {
        String[] res = new String[list.length];
        for (int i = 0; i < list.length; ++i) {
            res[i] = Integer.toHexString(list[i]);
            if (res[i].length() < 2) {
                res[i] = new StringBuffer(res[i]).insert(0, "0").toString();
            }
            if (res[i].length() > 2) {
                res[i] = res[i].substring(res[i].length() - 2, res[i].length());
            }
        }
        return res;
    }

    static HashMap<String, String> map_radix;

    static {
        map_radix = new HashMap<>();
        map_radix.put("0", "0000");
        map_radix.put("1", "0001");
        map_radix.put("2", "0010");
        map_radix.put("3", "0011");
        map_radix.put("4", "0100");
        map_radix.put("5", "0101");
        map_radix.put("6", "0110");
        map_radix.put("7", "0111");
        map_radix.put("8", "1000");
        map_radix.put("9", "1001");
        map_radix.put("a", "1010");
        map_radix.put("b", "1011");
        map_radix.put("c", "1100");
        map_radix.put("d", "1101");
        map_radix.put("e", "1110");
        map_radix.put("f", "1111");

    }

    public static String getBinary(String[] str) {
        String res = "";
        for (int i = 0; i < str.length; ++i) {
            res += map_radix.get(str[i].substring(0, 1)) + map_radix.get(str[i].substring(1, 2)) + " ";
        }
        return res;
    }

    static HashMap<String, String> map_inst_R;

    static {
        map_inst_R = new HashMap<String, String>();
        map_inst_R.put("100000", "add");
        map_inst_R.put("100001", "addu");
        map_inst_R.put("100010", "sub");
        map_inst_R.put("100011", "subu");
        map_inst_R.put("101010", "slt");
        map_inst_R.put("101011", "sltu");
        map_inst_R.put("000100", "sllv");
        map_inst_R.put("000000", "sll");
    }

    static HashMap<String, String> map_inst;

    static {
        map_inst = new HashMap<String, String>();
        map_inst.put("001101", "ori");
        map_inst.put("001001", "addiu");
        map_inst.put("100011", "lw");
        map_inst.put("101011", "sw");
        map_inst.put("000100", "beq");
        map_inst.put("000010", "jump");
        map_inst.put("001000", "addi");
        map_inst.put("000101", "bne");
        map_inst.put("100000", "lb");
        map_inst.put("101000", "sb");
        map_inst.put("001111", "lui");
    }

    // static HashMap<String, String> map_reg

    public static String getBinary_complete(String[] str) {
        String res = "";
        for (int i = 3; i >= 0; --i) {
            res += map_radix.get(str[i].substring(0, 1)) + map_radix.get(str[i].substring(1, 2));
        }
        String op = res.substring(0, 6);
        String func = res.substring(26, 32);
        res = res.substring(0, 6) + " " + res.substring(6, 11) + " " + res.substring(11, 16) + " "
                + res.substring(16, 21) + " " + res.substring(21, 26) + " " + res.substring(26, 32);
        if (op.equals("000000")) {
            res += " " + map_inst_R.get(func);
        } else
            res += " " + map_inst.get(op);
        return res;
    }

    public static void main(String[] args) {
        var scan = new Scanner(System.in);
        while (true) {
            System.out.print("1.Dump\nInput:");
            String s = scan.nextLine();
            int select;
            try {
                select = Integer.parseInt(s);
            } catch (NumberFormatException e) {
                break;
            }
            switch (select) {
                case (1):
                    System.out.print("Please Input the filename:");
                    String filename = scan.nextLine();
                    try {
                        var file = new BufferedInputStream(new FileInputStream(filename));

                        ArrayList<Byte> Inst = null;
                        Inst = getInst(file);
                        int[] byte_inst = new int[4];
                        var output = new BufferedOutputStream(new FileOutputStream(filename + "res.txt"));
                        for (int i = 0; i < Inst.size(); i += 4) {
                            byte_inst[0] = Integer.valueOf(Inst.get(i));
                            byte_inst[1] = Integer.valueOf(Inst.get(i + 1));
                            byte_inst[2] = Integer.valueOf(Inst.get(i + 2));
                            byte_inst[3] = Integer.valueOf(Inst.get(i + 3));
                            String[] res = toHex(byte_inst);
                            String res_16 = Arrays.toString(res);
                            String res_2 = getBinary(res);
                            String res_2_complete = getBinary_complete(res);
                            String output_Str = res_16 + "\t" + res_2 + "\t" + res_2_complete + "\n";
                            System.out.println(output_Str);
                            output.write(output_Str.getBytes());
                        }
                        output.close();
                        file.close();
                    } catch (IOException e) {
                        break;
                    }
                default:
                    break;
            }

        }
    }
}
