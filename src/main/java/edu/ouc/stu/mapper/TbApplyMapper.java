package edu.ouc.stu.mapper;

import edu.ouc.stu.model.TbApply;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface TbApplyMapper {

    TbApply selectByPrimaryKey(Integer applyId);

    List<TbApply> selectAllByUserId(Integer applyUserId);

    List<TbApply> selectAll();

    int deleteByPrimaryKey(Integer applyId);

    int insert(TbApply record);

    int updateByPrimaryKey(TbApply record);

}
