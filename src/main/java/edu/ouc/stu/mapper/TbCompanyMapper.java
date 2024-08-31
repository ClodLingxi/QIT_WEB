package edu.ouc.stu.mapper;

import edu.ouc.stu.model.TbCompany;
import edu.ouc.stu.model.TbJob;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

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
     * select all company
     *
     * @return List of Company
     */
    List<TbCompany> selectAllCompany();

    /**
     * select all company id and name
     *
     * @return List of Company id and name
     */
    List<TbCompany> selectAllCompanyName();

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