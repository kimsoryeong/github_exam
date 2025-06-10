package com.example.demo.service;

import org.springframework.stereotype.Service;

import com.example.demo.dao.BoardDao;
import com.example.demo.dto.Board;

@Service
public class FileService {

	private BoardDao boardDao;
	
	public FileService(BoardDao boardDao) {
		this.boardDao = boardDao;
	}

	public Board getBoard(int boardId) {
		return this.boardDao.getBoard(boardId);
	}

}