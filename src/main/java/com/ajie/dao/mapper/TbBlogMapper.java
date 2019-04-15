package com.ajie.dao.mapper;

import com.ajie.dao.pojo.TbBlog;
import com.ajie.dao.pojo.TbBlogExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface TbBlogMapper {
	int countByExample(TbBlogExample example);

	int deleteByExample(TbBlogExample example);

	int deleteByPrimaryKey(Integer id);

	int insert(TbBlog record);

	int insertSelective(TbBlog record);

	List<TbBlog> selectByExample(TbBlogExample example);

	TbBlog selectByPrimaryKey(Integer id);

	int updateByExampleSelective(@Param("record") TbBlog record,
			@Param("example") TbBlogExample example);

	int updateByExample(@Param("record") TbBlog record, @Param("example") TbBlogExample example);

	int updateByPrimaryKeySelective(TbBlog record);

	int updateByPrimaryKey(TbBlog record);

	/**
	 * 获取所有博客的条数
	 * 
	 * @return
	 */
	int getBlogCount();

	/**
	 * 获取用户博客数
	 * 
	 * @param userId
	 * @return
	 */
	int getUserBlogCount(int userId);

	/**
	 * 更新博客的阅读数和评论数
	 * 
	 * @param blogId
	 * @param commentCount
	 * @param readNum
	 * @return
	 */
	int updateBlogCRCount(@Param("id") int id, @Param("commentCount") int commentCount,
			@Param("readNum") int readNum);

	/**
	 * 更新博客状态
	 * 
	 * @param id
	 * @param mark
	 * @return
	 */
	void updateBlogMark(@Param("id") int id, @Param("userId") int userId, @Param("mark") int mark);

	/**
	 * 批量更新指定用户的博客状态
	 * 
	 * @param id
	 * @param mark
	 * @return
	 */
	void updateBlogsMark(@Param("userId") int userId, @Param("mark") int mark);

	/**
	 * 查询指定状态的博客
	 * 
	 * @param userId
	 * @param marks
	 * @return
	 */
	List<TbBlog> selectBlogsByState(@Param("userId") int userId, @Param("marks") List<Integer> marks);
}