public class T4_JSON2ApexCurrentTime {

    public Integer week_number;
    public String utc_offset;
    public String utc_datetime;
    public Integer unixtime;
    public String timezone;
    public Integer raw_offset;
    public Object dst_until;
    public Integer dst_offset;
    public Object dst_from;
    public Boolean dst;
    public Integer day_of_year;
    public Integer day_of_week;
    public String datetime2;
    public String client_ip;
    public String abbreviation;

    public static T4_JSON2ApexCurrentTime parse(String json) {
        return (T4_JSON2ApexCurrentTime) System.JSON.deserialize(json, T4_JSON2ApexCurrentTime.class);
    }
}