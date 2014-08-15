using UnityEngine;
using System.Collections;

public class StepStat
{
		public int cost, owner;
		public bool station_event_trigger = false, dialog_related_to_land = false, dialog_for_bank = false;
		private relation buildingtitle;
		private Property.locType level;
		private Property cache_current_property;
		internal enum relation
		{
				MY_PROPERTY,
				UNCLAIMED,
				OWNED_BY_OTHER,
				FUNCTIONAL_LAND
		}
		public Property property {
				get{ return this.cache_current_property;}
		}

		public StepStat ()
		{
		}
	
		public void withLocation (Property place)
		{
				Property.passing_event station_ent = place.event_pass;
				level = place.blocktype;
				owner = place.owned_by_id;
				station_event_trigger = station_ent != Property.passing_event.NOTHING;
				Property.locType landinvestment_related = Property.locType.LAND | Property.locType.BUILDING | Property.locType.HOUSE | Property.locType.MOTEL | Property.locType.HOTEL | Property.locType.HOTELCASINO | Property.locType.GRANDHOTELRESORT;
				dialog_related_to_land = (level & landinvestment_related) == level;
				dialog_for_bank = level == Property.locType.BANK;
				cache_current_property = place;
				Debug.Log ("is dialog_related_to_land: " + dialog_related_to_land);
		}
	
		public void thinkSpecialEvent ()
		{
		
		}
	
		public void withPlayer (RichChar user)
		{
				user.landing = cache_current_property;
				user.stepdata = this;
				if (owner == -1) {
						buildingtitle = relation.UNCLAIMED;
				} else if (owner == -2) {
						buildingtitle = relation.FUNCTIONAL_LAND;
				} else {
						if (owner == user.owner_id)
								buildingtitle = relation.MY_PROPERTY;
						if (owner != user.owner_id) {
								buildingtitle = relation.OWNED_BY_OTHER;
						}
				}
		}
	
		public bool qualified_to_rent ()
		{
				return	buildingtitle == relation.OWNED_BY_OTHER && level != Property.locType.LAND;
		}
	
		public bool from_unclaim_to_buy_action ()
		{
				return buildingtitle == relation.UNCLAIMED;
		}
	
		public bool functional_property ()
		{
				return buildingtitle == relation.FUNCTIONAL_LAND;
		}
	
		public bool is_others_land_only ()
		{
				return	buildingtitle == relation.OWNED_BY_OTHER && level == Property.locType.LAND;
		}
		/**
		 * the user is going to invest his or her own property
		 * 
		 */
		public bool can_invest ()
		{
				return	buildingtitle == relation.MY_PROPERTY && dialog_related_to_land;
		}
}