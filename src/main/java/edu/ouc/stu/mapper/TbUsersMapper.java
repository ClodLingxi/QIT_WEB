package edu.ouc.stu.mapper;

import edu.ouc.stu.model.TbUsers;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface TbUsersMapper {

    /**
     * validate by username, password and role
     * @param tbUsers data source
     * @return userID
     */
    Object validate(TbUsers tbUsers);

    /**
     * query state by id
     * @param userId primaryKey
     * @return state
     */
    int isEnable(Integer userId);

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
     * select some users by param
     * @param startUser start user row
     * @param userRole user role
     * @param selectName user realName
     * @return List of Users
     */
    List<TbUsers> selectSomeUsersByParam(@Param("startUser")int startUser, @Param("userRole")String userRole, @Param("selectName") String selectName);

    /**
     * select by user search
     * @param userRole user role
     * @param selectName user realName
     * @return object by user search
     */
    List<TbUsers> selectByParam(@Param("userRole")String userRole, @Param("selectName") String selectName);

    /**
     * select some users
     * @param startUser start user row
     * @return List of Users
     */
    List<TbUsers> selectSomeUsers(@Param("startUser")int startUser);


    /**
     * select all users
     * @return List of Users
     */
    List<TbUsers> selectAllUsers();

    Integer countAllUsers();

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