Rails.application.routes.draw do

  get("/", { :controller => "parks", :action => "index" })

  # Routes for the Trip resource:

  # CREATE
  post("/insert_trip", { :controller => "trips", :action => "create" })
          
  # READ
  get("/trips", { :controller => "trips", :action => "index" })
  
  get("/trips/:path_id", { :controller => "trips", :action => "show" })
  
  # UPDATE
  
  post("/modify_trip/:path_id", { :controller => "trips", :action => "update" })
  
  # DELETE
  get("/delete_trip/:path_id", { :controller => "trips", :action => "destroy" })

  #------------------------------

  # Routes for the User account:

  # SIGN UP FORM
  get("/user_sign_up", { :controller => "user_authentication", :action => "sign_up_form" })        
  # CREATE RECORD
  post("/insert_user", { :controller => "user_authentication", :action => "create"  })
      
  # EDIT PROFILE FORM        
  get("/edit_user_profile", { :controller => "user_authentication", :action => "edit_profile_form" })       
  # UPDATE RECORD
  post("/modify_user", { :controller => "user_authentication", :action => "update" })
  
  # DELETE RECORD
  get("/cancel_user_account", { :controller => "user_authentication", :action => "destroy" })

  # ------------------------------

  # SIGN IN FORM
  get("/user_sign_in", { :controller => "user_authentication", :action => "sign_in_form" })
  # AUTHENTICATE AND STORE COOKIE
  post("/user_verify_credentials", { :controller => "user_authentication", :action => "create_cookie" })
  
  # SIGN OUT        
  get("/user_sign_out", { :controller => "user_authentication", :action => "destroy_cookies" })
             
  #------------------------------

  # Routes for the Attraction resource:

  # CREATE
  post("/insert_attraction", { :controller => "attractions", :action => "create" })
          
  # READ
  get("/attractions", { :controller => "attractions", :action => "index" })
  
  get("/attractions/:path_id", { :controller => "attractions", :action => "show" })
  
  # UPDATE
  
  post("/modify_attraction/:path_id", { :controller => "attractions", :action => "update" })
  
  # DELETE
  get("/delete_attraction/:path_id", { :controller => "attractions", :action => "destroy" })

  #------------------------------

  # Routes for the Activity resource:

  # CREATE
  post("/insert_activity", { :controller => "activities", :action => "create" })
          
  # READ
  get("/activities", { :controller => "activities", :action => "index" })
  
  get("/activities/:path_id", { :controller => "activities", :action => "show" })
  
  # UPDATE
  
  post("/modify_activity/:path_id", { :controller => "activities", :action => "update" })
  
  # DELETE
  get("/delete_activity/:path_id", { :controller => "activities", :action => "destroy" })

  #------------------------------

  # Routes for the State resource:

  # CREATE
  # post("/insert_state", { :controller => "states", :action => "create" })
          
  # READ
  get("/states", { :controller => "states", :action => "index" })
  
  get("/states/:path_id", { :controller => "states", :action => "show" })
  
  # UPDATE
  
  # post("/modify_state/:path_id", { :controller => "states", :action => "update" })
  
  # DELETE
  # get("/delete_state/:path_id", { :controller => "states", :action => "destroy" })

  #------------------------------

  # Routes for the Park resource:

  # CREATE
  post("/insert_park", { :controller => "parks", :action => "create" })
          
  # READ
  get("/parks", { :controller => "parks", :action => "index" })
  
  get("/parks/:path_id", { :controller => "parks", :action => "show" })
  
  # UPDATE
  
  post("/modify_park/:path_id", { :controller => "parks", :action => "update" })
  
  # DELETE
  get("/delete_park/:path_id", { :controller => "parks", :action => "destroy" })

  #------------------------------

end
