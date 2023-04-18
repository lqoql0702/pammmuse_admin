//package pammmuse_admin.adminservice.controller;
//
//import lombok.RequiredArgsConstructor;
//import org.springframework.web.bind.annotation.*;
//import org.springframework.web.multipart.MultipartFile;
//import pammmuse_admin.adminservice.domain.AwsS3;
//import pammmuse_admin.adminservice.service.AwsS3Service;
//
//import java.io.IOException;
//
//@RestController
//@RequestMapping("/s3")
//@RequiredArgsConstructor
//public class AwsS3Controller {
//
//    private final AwsS3Service awsS3Service;
//
//
//    @PostMapping("/resource")
//    public AwsS3 upload(@RequestPart("file") MultipartFile multipartFile) throws IOException {
//        return awsS3Service.upload(multipartFile,"upload");
//    }
//
////    @GetMapping("/resource")
////    public AwsS3 save(@RequestPart("file") MultipartFile multipartFile) throws IOException {
////        return awsS3Service.put
////    }
//
//    @DeleteMapping("/resource")
//    public void remove(AwsS3 awsS3) {
//        awsS3Service.remove(awsS3);
//    }
//}