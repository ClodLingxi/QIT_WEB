package edu.ouc.stu.mapper;

import edu.ouc.stu.model.TbApplicant;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface TbApplicantMapper {
    /**
     * delete by primary key
     * @param applicantId primaryKey
     * @return deleteCount
     */
    int deleteByPrimaryKey(Integer applicantId);

    /**
     * insert record to table
     * @param record the record
     * @return insert count
     */
    int insert(TbApplicant record);

    /**
     * insert record to table selective
     * @param record the record
     * @return insert count
     */
    int insertSelective(TbApplicant record);

    /**
     * select by primary key
     * @param applicantId primary key
     * @return object by primary key
     */
    TbApplicant selectByPrimaryKey(Integer applicantId);

    /**
     * update record selective
     * @param record the updated record
     * @return update count
     */
    int updateByPrimaryKeySelective(TbApplicant record);

    /**
     * update record
     * @param record the updated record
     * @return update count
     */
    int updateByPrimaryKey(TbApplicant record);
}