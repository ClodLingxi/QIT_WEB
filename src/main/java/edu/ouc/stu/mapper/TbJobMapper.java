package edu.ouc.stu.mapper;

import edu.ouc.stu.model.TbJob;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface TbJobMapper {
    /**
     * delete by primary key
     * @param jobId primaryKey
     * @return deleteCount
     */
    int deleteByPrimaryKey(Integer jobId);

    /**
     * insert record to table
     * @param record the record
     * @return insert count
     */
    int insert(TbJob record);

    /**
     * insert record to table selective
     * @param record the record
     * @return insert count
     */
    int insertSelective(TbJob record);

    /**
     * select by primary key
     * @param jobId primary key
     * @return object by primary key
     */
    TbJob selectByPrimaryKey(Integer jobId);

    /**
     * update record selective
     * @param record the updated record
     * @return update count
     */
    int updateByPrimaryKeySelective(TbJob record);

    /**
     * update record
     * @param record the updated record
     * @return update count
     */
    int updateByPrimaryKey(TbJob record);
}