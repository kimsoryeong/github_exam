package com.example.demo.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.demo.dto.Article;
import com.example.demo.dto.Board;
import com.example.demo.dto.Req;
import com.example.demo.service.ArticleService;
import com.example.demo.service.BoardService;
import com.example.demo.util.Util;

@Controller
public class UsrArticleController {
	
	private ArticleService articleService;
	private BoardService boardService;
	private Req req;
	
	public UsrArticleController(ArticleService articleService, BoardService boardService, Req req) {
		this.articleService = articleService;
		this.boardService = boardService;
		this.req = req;
	}
	
	@GetMapping("/usr/article/mainWrite")
	public String mainWrite() {
		return "usr/article/mainWrite"; // 글쓰기 유형 선택 페이지
	}

	@PostMapping("/usr/article/doWrite")
	@ResponseBody
	public String doWrite(String title, String content, int boardId) {
		
		this.articleService.writeArticle(title, content, this.req.getLoginedMember().getId(), boardId);
		
		int id = this.articleService.getLastArticleId();
		
		return Util.jsReplace("게시글 작성!", String.format("detail?id=%d", id));
	}
	
	@GetMapping("/usr/article/interviewWrite")
	public String interviewWrite() {
		return "usr/article/interviewWrite";
	}
	
	@GetMapping("/usr/article/practiceWrite")
	public String practiceWrite() {
		return "usr/article/practiceWrite";
	}
	
	@GetMapping("/usr/article/workingWrite")
	public String workingWrite() {
		return "usr/article/workingWrite";
	}
	
	/*
	 * @GetMapping("/usr/article/selectWrite") public String selectWrite(String
	 * type, int boardId) { switch (type) { case "interview": return
	 * "redirect:/usr/article/interviewWrite?boardId=" + boardId; case "practice":
	 * return "redirect:/usr/article/practiceWrite?boardId=" + boardId; case
	 * "working": return "redirect:/usr/article/workingWrite?boardId=" + boardId;
	 * default: return "redirect:/usr/article/mainWrite?boardId=" + boardId; } }
	 */

	
	@GetMapping("/usr/article/list")
	public String List(Model model, int boardId, @RequestParam(defaultValue = "1") int cPage) {
		
		int articlesInPage = 10;
		int limitFrom = (cPage - 1) * articlesInPage;
		
		int articlesCnt = this.articleService.getArticlesCnt(boardId);
		
		int totalPagesCnt = (int) Math.ceil(articlesCnt / (double) articlesInPage);
	
		int begin = ((cPage - 1) / 10) * 10 + 1;
		int end = (((cPage - 1) / 10) + 1) * 10;
		
		if (end > totalPagesCnt) {
			end = totalPagesCnt;
		}
		
		Board board = this.boardService.getBoard(boardId);
		List<Article> articles = this.articleService.getArticles(boardId, articlesInPage, limitFrom);
		
		model.addAttribute("cPage", cPage);
		model.addAttribute("begin", begin);
		model.addAttribute("end", end);
		model.addAttribute("totalPagesCnt", totalPagesCnt);
		model.addAttribute("articlesCnt", articlesCnt);
		model.addAttribute("articles", articles);
		model.addAttribute("board", board);
		
		return "usr/article/list";
	}
	
	@GetMapping("/usr/article/detail")
	public Object detail(Model model, int id) {
		
		Article article = this.articleService.getArticleById(id);
		
		model.addAttribute("article", article);
		
		return "usr/article/detail";
	}
	
	@GetMapping("/usr/article/modify")
	public String modify(Model model, int id) {
		
		Article article = this.articleService.getArticleById(id);
		
		model.addAttribute("article", article);
		
		return "usr/article/modify";
	}
	
	@PostMapping("/usr/article/doModify")
	@ResponseBody
	public String doModify(int id, String title, String content) {
		
		this.articleService.modifyArticle(id, title, content);
		
		return Util.jsReplace(String.format("%d번 게시물을 수정했습니다", id), String.format("detail?id=%d", id));
	}
	
	@GetMapping("/usr/article/delete")
	@ResponseBody
	public String delete(int id, int boardId) {
		
		this.articleService.deleteArticle(id);
		
		return Util.jsReplace(String.format("%d번 게시글이 삭제되었습니다", id), String.format("list?boardId=%d", boardId));
	}
	
	@PostMapping("/usr/article/list")
	@ResponseBody
	public void SearchKeyword(Model model, @RequestParam String searchType, @RequestParam String keyword) {
		List<Article> articles = articleService.SearchKeyword(searchType, keyword);
		model.addAttribute("articles", articles);
		
	}
}