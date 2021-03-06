/*
 * 版本： 4.0
 * 日期：2018/7/9 11:31:43
 * 
 * 描述：实体类
 * 
 */

using System;
using System.Collections.Generic;

namespace Game.Entity.NativeWeb
{
    /// <summary>
    /// 实体类 CacheRankAward  (属性说明自动提取数据库字段的描述信息)
    /// </summary>
    [Serializable]
    public partial class CacheRankAward
    {
        #region 常量 

        /// <summary>
        /// 表名
        /// </summary>
        public const string Tablename = "CacheRankAward";

        #endregion 

        #region 私有变量

        private int p_dateid;
        private int p_userid;
        private byte p_typeid;
        private int p_gameid;
        private string p_nickname;
        private string p_faceurl;
        private int p_faceid;
        private int p_ranknum;
        private Int64 p_rankvalue;
        private Int64 p_gold;
        private int p_diamond;
        private DateTime p_collectdate;

        #endregion

        #region 构造函数 

        /// <summary>
        /// 初始化CacheRankAward
        /// </summary>
        public CacheRankAward() 
        {
            p_dateid = 0;
            p_userid = 0;
            p_typeid = 0;
            p_gameid = 0;
            p_nickname = string.Empty;
            p_faceurl = string.Empty;
            p_faceid = 0;
            p_ranknum = 0;
            p_rankvalue = 0;
            p_gold = 0;
            p_diamond = 0;
            p_collectdate = DateTime.Now;
        }

        #endregion

        #region 公共属性 

        /// <summary>
        /// DateID
        /// </summary>
        public int DateID
        {
            set
            {
                p_dateid=value;
            }
            get
            {
                return p_dateid;
            }
        }

        /// <summary>
        /// UserID
        /// </summary>
        public int UserID
        {
            set
            {
                p_userid=value;
            }
            get
            {
                return p_userid;
            }
        }

        /// <summary>
        /// TypeID
        /// </summary>
        public byte TypeID
        {
            set
            {
                p_typeid=value;
            }
            get
            {
                return p_typeid;
            }
        }

        /// <summary>
        /// GameID
        /// </summary>
        public int GameID
        {
            set
            {
                p_gameid=value;
            }
            get
            {
                return p_gameid;
            }
        }

        /// <summary>
        /// NickName
        /// </summary>
        public string NickName
        {
            set
            {
                p_nickname=value;
            }
            get
            {
                return p_nickname;
            }
        }

        /// <summary>
        /// FaceUrl
        /// </summary>
        public string FaceUrl
        {
            set
            {
                p_faceurl=value;
            }
            get
            {
                return p_faceurl;
            }
        }

        /// <summary>
        /// FaceID
        /// </summary>
        public int FaceID
        {
            set
            {
                p_faceid=value;
            }
            get
            {
                return p_faceid;
            }
        }

        /// <summary>
        /// RankNum
        /// </summary>
        public int RankNum
        {
            set
            {
                p_ranknum=value;
            }
            get
            {
                return p_ranknum;
            }
        }

        /// <summary>
        /// RankValue
        /// </summary>
        public Int64 RankValue
        {
            set
            {
                p_rankvalue=value;
            }
            get
            {
                return p_rankvalue;
            }
        }

        /// <summary>
        /// Gold
        /// </summary>
        public Int64 Gold
        {
            set
            {
                p_gold=value;
            }
            get
            {
                return p_gold;
            }
        }

        /// <summary>
        /// Diamond
        /// </summary>
        public int Diamond
        {
            set
            {
                p_diamond=value;
            }
            get
            {
                return p_diamond;
            }
        }

        /// <summary>
        /// CollectDate
        /// </summary>
        public DateTime CollectDate
        {
            set
            {
                p_collectdate=value;
            }
            get
            {
                return p_collectdate;
            }
        }

        #endregion
    }
}

