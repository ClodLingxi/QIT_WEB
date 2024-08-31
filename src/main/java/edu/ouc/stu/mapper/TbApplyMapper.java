package edu.ouc.stu.mapper;

import edu.ouc.stu.model.TbApply;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface TbApplyMapper {
    /**
     * delete by primary key
     * @param applyId primaryKey
     * @return deleteCount
     */
    int deleteByPrimaryKey(Integer applyId);

    /**
     * insert record to table
     * @param record the record
     * @return insert count
     */
    int insert(TbApply record);

    /**
     * insert record to table selective
     * @param record the record
     * @return insert count
     */
    int insertSelective(TbApply record);

    /**
     * select by primary key
     * @param applyId primary key
     * @return object by primary key
     */
    TbApply selectByPrimaryKey(Integer applyId);

    /**
     * update record selective
     * @param record the updated record
     * @return update count
     */
    int updateByPrimaryKeySelective(TbApply record);

    /**
     * update record
     * @param record the updated record
     * @return update count
     */
    int updateByPrimaryKey(TbApply record);
}