package pammmuse_admin.adminservice.domain;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter @Setter
@NoArgsConstructor
@AllArgsConstructor
public class User {
    private int user_no;
    private String id;
    private String passwd;
    private String name;

}
