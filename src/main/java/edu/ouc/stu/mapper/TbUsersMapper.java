package edu.ouc.stu.mapper;

import edu.ouc.stu.model.TbUsers;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface TbUsersMapper {

    /**
     * delete by primary key
     * @param userId primaryKey
     * @return deleteCount
     */
    int deleteByPrimaryKey(Integer userId);

    /**
     * insert record to table
     * @param record the record
     * @return insert count
     */
    int insert(TbUsers record);

    /**
     * insert record to table selective
     * @param record the record
     * @return insert count
     */
    int insertSelective(TbUsers record);

    /**
     * select by primary key
     * @param userId primary key
     * @return object by primary key
     */
    TbUsers selectByPrimaryKey(Integer userId);

    /**
     * update record selective
     * @param record the updated record
     * @return update count
     */
    int updateByPrimaryKeySelective(TbUsers record);

    /**
     * update record
     * @param record the updated record
     * @return update count
     */
    int updateByPrimaryKey(TbUsers record);
}