﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.Web;

namespace AskEpamEntities
{
	[DataContract]
	public class Skill
	{
		[DataMember]
		public int Id { get; set; }

		[DataMember]
		public string SkillName { get; set; }
	}
}