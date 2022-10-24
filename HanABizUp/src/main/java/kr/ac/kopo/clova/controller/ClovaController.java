package kr.ac.kopo.clova.controller;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import kr.ac.kopo.clova.service.ClovaService;
import kr.ac.kopo.clova.vo.FileVO;

@Controller
public class ClovaController {

	@Autowired
	private ClovaService clovaService;

	// 사업자등록증 파일이름 확인
	@ResponseBody
	@GetMapping("clovaOCR/{fileName}")
	public String clovaOCR(@PathVariable("fileName") String fileName) {
		System.out.println(fileName);
		String jsonData = clovaService.ClovaResponse(fileName);
		return jsonData;
	}

	// 사업자등록증 업로드
	@PostMapping("/upload")
	public String upload(@RequestParam MultipartFile[] uploadfile, Model model, HttpServletRequest request)
			throws IllegalStateException, IOException {

		for (MultipartFile file : uploadfile) {
			if (!file.isEmpty()) {
				FileVO fileVO = new FileVO(UUID.randomUUID().toString(), file.getOriginalFilename(),
						file.getContentType());

				String fileName = fileVO.getUuid() + "_" + fileVO.getFileName();

				File newFileName = new File(fileName);

				file.transferTo(newFileName);
				System.out.println("파일저장 완료");
				
				String loanProductCode = request.getParameter("loanProductCode");
				model.addAttribute("loanProductCode", loanProductCode);
				model.addAttribute("fileName", fileName);
				System.out.println(loanProductCode);
				System.out.println(fileName);
				
			}
		}

		return "loan/applyLoan";
	}

}
