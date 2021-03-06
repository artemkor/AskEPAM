﻿using AskEpamEntities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace AskEpamWCFService.Gateway
{
    public class CommentProvider
    {
        public static void AddComment(int idQuestion, string text)
        {
            AskEpamDB_LINQDataContext context = new AskEpamDB_LINQDataContext();

            Comment userComment = new Comment()
            {
                idQuestion = 0,
                text = text
            };

            context.Comments.InsertOnSubmit(userComment);
            context.Comments.Context.SubmitChanges();
        }

        public static List<UserComment> ListComments()
        {
            List<UserComment> userComments = new List<UserComment>();

            AskEpamDB_LINQDataContext context = new AskEpamDB_LINQDataContext();
            List<Comment> allUserQuestions = context.Comments.ToList();

            foreach (Comment comment in allUserQuestions)
            {
                userComments.Add(new UserComment(Convert.ToInt32(comment.idQuestion), comment.text));
            }

            return userComments;
        }
    }
}