using System.Collections.Generic;
namespace CVLK2011.Models
{
    public class MemberHomeListViewModel
    {
        public IList<GetTopFiveNewEvent_Result> EventList { get; set; }
        public string CurrentEvent { get; set; }
        public PagingInfo PagingEventInfo { get; set; }
        //friends
        public IList<GetAllFriendsOfCurrentUserByID_Result> FriendList { get; set; }
        public string CurrentFriend { get; set; }
        public PagingInfo PagingFriendInfo { get; set; }
        //blogs
        public IList<GetTopFiveBlogByUserID_Result> BlogList { get; set; }
        public string CurrentBlog { get; set; }
        public PagingInfo PagingBlogInfo { get; set; }
        //Albums
        public IList<GetTopFiveAlbumAndPhotoByUserID_Result> AlbumList { get; set; }
        public string CurrentAlbum { get; set; }
        public PagingInfo PagingAlbumInfo { get; set; }
        //Comments
        public IList<GetAllCommentsByWall_Result> CommentList { get; set; }
        public string CurrentComment { get; set; }
        public PagingInfo PagingCommentInfo { get; set; }
        //comment relation
        public IList<GetAllCommentRelationByCommentID_Result> CommentRelationList { get; set; }
        public PagingInfo PagingCommentRelationInfo { get; set; }
        public string CurrentcommentRelation { get; set; }
       
        //extra name 
        public int UserIDOnWall { get; set; }
        public string UserNameOnWall { get; set; }
        public string PictureOnWall { get; set; }
        public string MainContent { get; set; }
        public string SubContent { get; set; }
        public int commentid { get; set; }
        public bool ShowAll  { get; set; }
        //
        //filter conditions
        public string Filter { get; set; }
        
    }
}