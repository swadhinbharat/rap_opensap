CLASS zcl_rap_eml_sp DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_rap_eml_sp IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

*    " step 1 - READ
*    READ ENTITIES OF ZI_RAP_Travel_SP
*      ENTITY travel
*        ALL FIELDS
*      WITH VALUE #( ( TravelUUID = '1F890EC05503D7521700030203378CE2' ) )
*      RESULT DATA(travels).
*
*    out->write( travels ).

*    " step 2 - READ with Fields
*    READ ENTITIES OF ZI_RAP_Travel_SP
*      ENTITY travel
*        FIELDS ( AgencyID CustomerID )
*      WITH VALUE #( ( TravelUUID = '1F890EC05503D7521700030203378CE2' ) )
*      RESULT DATA(travels).
*    out->write( travels ).

*     " step 3 - READ with All Fields
*    READ ENTITIES OF ZI_RAP_Travel_SP
*      ENTITY travel
*        ALL FIELDS
*      WITH VALUE #( ( TravelUUID = '1F890EC05503D7521700030203378CE2' ) )
*      RESULT DATA(travels).
*
*    out->write( travels ).

*    " step 4 - READ By Association
*    READ ENTITIES OF ZI_RAP_Travel_SP
*      ENTITY travel BY \_Booking
*        ALL FIELDS WITH VALUE #( ( TravelUUID = '1F890EC05503D7521700030203378CE2' ) )
*      RESULT DATA(bookings).
*
*    out->write( bookings ).

*     " step 5 - Unsuccessful READ
*     READ ENTITIES OF ZI_RAP_Travel_SP
*       ENTITY travel
*         ALL FIELDS WITH VALUE #( ( TravelUUID = '11111111111111111111111111111111' ) )
*       RESULT DATA(travels)
*       FAILED DATA(failed)
*       REPORTED DATA(reported).
*
*     out->write( travels ).
*     out->write( failed ).    " complex structures not supported by the console output
*     out->write( reported ).  " complex structures not supported by the console output

*     " step 6 - MODIFY Update
*     MODIFY ENTITIES OF ZI_RAP_Travel_SP
*       ENTITY travel
*         UPDATE
*           SET FIELDS WITH VALUE
*             #( ( TravelUUID  = '1F890EC05503D7521700030203378CE2'
*                  Description = 'I like RAP@openSAP' ) )
*
*      FAILED DATA(failed)
*      REPORTED DATA(reported).
*
*     out->write( 'Update done' ).

*  " step 6b - Commit Entities
*     COMMIT ENTITIES
*       RESPONSE OF ZI_RAP_Travel_SP
*       FAILED     DATA(failed_commit)
*       REPORTED   DATA(reported_commit).

*" step 7 - MODIFY Create
*    MODIFY ENTITIES OF ZI_RAP_Travel_SP
*      ENTITY travel
*        CREATE
*          SET FIELDS WITH VALUE
*            #( ( %cid        = 'MyContentID_1'
*                 AgencyID    = '70012'
*                 CustomerID  = '14'
*                 BeginDate   = cl_abap_context_info=>get_system_date( )
*                 EndDate     = cl_abap_context_info=>get_system_date( ) + 10
*                 Description = 'I like RAP@openSAP' ) )
*
*     MAPPED DATA(mapped)
*     FAILED DATA(failed)
*     REPORTED DATA(reported).
*
*    out->write( mapped-travel ).
*
*    COMMIT ENTITIES
*      RESPONSE OF ZI_RAP_Travel_SP
*      FAILED     DATA(failed_commit)
*      REPORTED   DATA(reported_commit).
*
*    out->write( 'Create done' ).

    " step 8 - MODIFY Delete
    MODIFY ENTITIES OF ZI_RAP_Travel_SP
      ENTITY travel
        DELETE FROM
          VALUE
            #( ( TravelUUID  = '02C98DF0B4E01EDB89E8DE12BA107747' ) )

     FAILED DATA(failed)
     REPORTED DATA(reported).

    COMMIT ENTITIES
      RESPONSE OF ZI_RAP_Travel_SP
      FAILED     DATA(failed_commit)
      REPORTED   DATA(reported_commit).

    out->write( 'Delete done' ).

  ENDMETHOD.
ENDCLASS.
