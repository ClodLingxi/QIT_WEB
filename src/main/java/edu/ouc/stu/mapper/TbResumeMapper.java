package edu.ouc.stu.mapper;

import edu.ouc.stu.model.TbJob;
import edu.ouc.stu.model.TbResume;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface TbResumeMapper {
    /**
     * delete by primary key
     * @param resumeId primaryKey
     * @return deleteCount
     */
    int deleteByPrimaryKey(Integer resumeId);

    /**
     * insert record to table
     * @param record the record
     * @return insert count
     */
    int insert(TbResume record);

    /**
     * insert record to table selective
     * @param record the record
     * @return insert count
     */
    int insertSelective(TbResume record);

    /**
     * select by primary key
     * @param resumeId primary key
     * @return object by primary key
     */
    TbResume selectByPrimaryKey(Integer resumeId);

    TbResume selectByUserId(Integer resume_userId);

    /**
     * select all resumes
     *
     * @return List of resumes
     */
    List<TbResume> selectAllResumes();

    /**
     * update record selective
     * @param record the updated record
     * @return update count
     */
    int updateByPrimaryKeySelective(TbResume record);

    /**
     * update record
     * @param record the updated record
     * @return update count
     */
    int updateByPrimaryKey(TbResume record);
}