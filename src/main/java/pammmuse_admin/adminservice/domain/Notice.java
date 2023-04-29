package pammmuse_admin.adminservice.domain;

import lombok.Getter;
import lombok.Setter;

import java.util.Date;

@Getter
@Setter
public class Notice {

    private int id;
    private String title;
    private String content;
    private Date reg_date;
    private Date update_date;

}
