package edu.ouc.stu.mapper;

import edu.ouc.stu.model.TbApply;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface TbApplyMapper {

    TbApply selectByPrimaryKey(Integer applyId);

    TbApply selectByUserIdAndJobId(@Param("applyUserId")Integer applyUserId, @Param("jobId")String jobId);

    List<TbApply> selectAllByUserId(Integer applyUserId);

    List<TbApply> selectAll();

    int deleteByPrimaryKey(Integer applyId);

    int insert(TbApply record);

    int updateByPrimaryKey(TbApply record);

}
