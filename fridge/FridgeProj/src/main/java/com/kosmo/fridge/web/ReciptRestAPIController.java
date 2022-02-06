package com.kosmo.fridge.web;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Vector;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.cloud.vision.v1.AnnotateImageRequest;
import com.google.cloud.vision.v1.AnnotateImageResponse;
import com.google.cloud.vision.v1.BatchAnnotateImagesResponse;
import com.google.cloud.vision.v1.Feature;
import com.google.cloud.vision.v1.Feature.Type;
import com.google.cloud.vision.v1.Image;
import com.google.cloud.vision.v1.ImageAnnotatorClient;
import com.google.protobuf.ByteString;
import com.kosmo.fridge.service.ReciptDTO;

import lombok.AllArgsConstructor;
import lombok.Getter;




@RestController
public class ReciptRestAPIController {
   
   @CrossOrigin
   @PostMapping("/receipe/reciptList.do")
   public ModelAndView getText(ModelAndView mav,MultipartFile imgsrc) throws FileNotFoundException, IOException {
      
      
         File file = new File(imgsrc.getOriginalFilename());
         imgsrc.transferTo(file);
         System.out.println(imgsrc);         
         
         List<AnnotateImageRequest> requests = new ArrayList<>();
         ByteString imgBytes = ByteString.readFrom(new FileInputStream(file));
         
         Map<String, Object> foodArr = new HashMap<>();
         List<ReciptDTO> list = new Vector<>();
         
         Image img = Image.newBuilder().setContent(imgBytes).build();
         Feature feat = Feature.newBuilder().setType(Type.TEXT_DETECTION).build();
         AnnotateImageRequest request = AnnotateImageRequest.newBuilder().addFeatures(feat).setImage(img).build();
         requests.add(request);
         try (ImageAnnotatorClient client = ImageAnnotatorClient.create()) {
            BatchAnnotateImagesResponse response = client.batchAnnotateImages(requests);
            List<AnnotateImageResponse> responses = response.getResponsesList();
            for (AnnotateImageResponse res : responses) {
               if (res.hasError()) {
                  System.out.printf("Error: %s\n", res.getError().getMessage());
                  return null;
               }
               
               //for (EntityAnnotation annotation : res.getTextAnnotationsList()) {
               
                  //System.out.printf("문자열 %s\n",annotation.getDescription());
               System.out.printf("문자열 %s\n",res.getTextAnnotationsList().get(0).getDescription());
                  //System.out.printf("Position : %s\n", annotation.getBoundingPoly());               
                  String regex = "^(\\d{3})\\s(\\D[^\\n]+)";
                  //String string = annotation.getDescription();
                  String string = res.getTextAnnotationsList().get(0).getDescription();
                   Pattern pattern = Pattern.compile(regex, Pattern.MULTILINE);
                   Matcher matcher = pattern.matcher(string);
                  
                    while (matcher.find()) {
                           //System.out.println("Full match: " + matcher.group());
                           String key = null;
                           String value = null;
                           for (int i = 1; i <= matcher.groupCount(); i++) {
                              //System.out.println(matcher.groupCount()); 
                               //System.out.println("재료 명 " + (i) + ": " + matcher.group(i));
                               String[] food = matcher.group(i).split(regex);   
                               //System.out.println(food);
                            //System.out.println(Arrays.toString(food));
                            key = matcher.group(1);
                            value = matcher.group(2);
                             foodArr.put(key,value);
                            //list.add(new Food(food[0], food[1]));
                            //System.out.println(arrMap);
                           }
                          
                           mav.setViewName("/receipe/reciptList");
                           mav.addObject("key", key);
                           mav.addObject("value", value);
                           mav.addObject("foodArr",foodArr);
                    }
               //}
                                             
                         
         }
//         if(file == null) {
//            
//         }
            
      }
         return mav;
   }
}