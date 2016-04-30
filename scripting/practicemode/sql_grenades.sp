static char g_sqlBuffer[1024];
static DBStatement grenadeInsertQuery = null;
static DBStatement grenadeFetchQuery = null;
static DBStatement userInsertQuery = null;
static DBStatement userFetchQuery = null;

public void InitQueries(Database db) {
    char error[256];
    grenadeInsertQuery = SQL_PrepareQuery(db,
        "INSERT INTO practicemode_grenades\
        (auth,map,id,name,description,categories,originx,originy,originz,anglex,angley,anglez)\
        VALUES\
        (?,?,?,?,?,?,?,?,?,?,?,?)",
        error, sizeof(error));
    if (grenadeInsertQuery == null)
        LogError(error);

    grenadeFetchQuery = SQL_PrepareQuery(db,
        "SELECT\
        (auth,map,id,name,description,categories,originx,originy,originz,anglex,angley,anglez)\
        FROM practicemode_grenades\
        WHERE auth = ?",
        error, sizeof(error));
    if (grenadeFetchQuery == null)
        LogError(error);
}

stock void FetchMapGrenades(KeyValues kv, const char[] auth="") {

}

stock void UpdateNewGrenades(KeyValues kv, ArrayList newGrenades) {
    char buffer[AUTH_LENGTH + GRENADE_ID_LENGTH + 1];
    char auth[AUTH_LENGTH];
    char idString[GRENADE_ID_LENGTH];

    for (int i = 0; i < newGrenades.Length; i++) {
        newGrenades.GetString(i, buffer, sizeof(buffer));
        int splitIndex = FindCharInString(buffer, "-");
        strcopy(auth, splitIndex, buffer);
        strcopy(idString, sizeof(idString), buffer[splitIndex + 1])

        // WriteNewGrenade(kv, auth, idString);
    }

    UpdatePlayerNames(kv);
}

static void WriteNewGrenade(KeyValues kv, const char[] auth, const char[] id) {
    float origin[3];
    float angles[3];
    char grenadeName[GRENADE_NAME_LENGTH];
    char categoryString[GRENADE_CATEGORY_LENGTH];
    char description[GRENADE_DESCRIPTION_LENGTH];

    if (kv.JumpToKey(auth)) {
        if (kv.JumpToKey(idString)) {
            g_GrenadeLocationsKv.GetString("name", name, sizeof(name));
            g_GrenadeLocationsKv.GetString("description", description, sizeof(description));
            g_GrenadeLocationsKv.GetString("categories", categoryString, sizeof(categoryString));
            g_GrenadeLocationsKv.GetVector("origin", origin);
            g_GrenadeLocationsKv.GetVector("angles", angles);
            SendWriteNewGrenadeQuery(auth, description, categoryString, origin, angles);
            kv.GoBack();
        }
        kv.GoBack();
    }
}

static void SendWriteNewGrenadeQuery(const char[] auth, const char[] description,
    const char[] categoryString, const float origin[3], const float[3] angles) {


    Format(g_sqlBuffer, sizeof(g_sqlBuffer),
        "INSERT INTO practicemode_grenades\
        (auth,map,id,name,description,categories,originx,originy,originz,anglex,angley,anglez)\
        VALUES\
        (%s,%s,%s,%s,%s,%s,%f,%f,%f,%f,%f,%f)",)

    ;
}

// static void WritePlayerNames(KeyValues kv) {

// }


/**
 * Generic SQL threaded query error callback.
 */
public void SQLErrorCheckCallback(Handle owner, Handle hndl, const char[] error, int data) {
    if (!StrEqual("", error)) {
        LogError("Last SQL Error: %s", error);
    }
}
