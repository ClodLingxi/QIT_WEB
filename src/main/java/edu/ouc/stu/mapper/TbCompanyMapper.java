package edu.ouc.stu.mapper;

import edu.ouc.stu.model.TbCompany;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface TbCompanyMapper {
    /**
     * delete by primary key
     * @param companyId primaryKey
     * @return deleteCount
     */
    int deleteByPrimaryKey(Integer companyId);

    /**
     * insert record to table
     * @param record the record
     * @return insert count
     */
    int insert(TbCompany record);

    /**
     * insert record to table selective
     * @param record the record
     * @return insert count
     */
    int insertSelective(TbCompany record);

    /**
     * select by primary key
     * @param companyId primary key
     * @return object by primary key
     */
    TbCompany selectByPrimaryKey(Integer companyId);

    /**
     * update record selective
     * @param record the updated record
     * @return update count
     */
    int updateByPrimaryKeySelective(TbCompany record);

    /**
     * update record
     * @param record the updated record
     * @return update count
     */
    int updateByPrimaryKey(TbCompany record);
}