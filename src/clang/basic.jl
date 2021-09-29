# IdentifierTable
get_name(x::IdentifierTable, s::String) = get(x, s)

# FileID
"""
    value(id::FileID) -> Int
Return the value of file ID.
"""
value(id::FileID) = Int(getHashValue(id))

# FileEntry
real_path_name(x::FileEntry) = tryGetRealPathName(x)
get_name(x::FileEntry) = getName(x)

# SourceLocation
value(x::SourceLocation) = getHashValue(x)

Base.string(x::SourceLocation) = printToString(x)

get_begin_loc(x::SourceRange) = getBeginLoc(x)
get_end_loc(x::SourceRange) = getEndLoc(x)

# SourceManager
function set_main_file(src_mgr::SourceManager, buffer::MemoryBuffer)
    id = FileID(src_mgr, buffer)
    setMainFileID(src_mgr, id)
    dispose(id)
    return nothing
end

function get_main_file_begin_loc(src_mgr::SourceManager)
    id = get_main_file_id(src_mgr)
    loc = getLocForStartOfFile(src_mgr, id)
    dispose(id)
    return loc
end

function get_main_file_end_loc(src_mgr::SourceManager)
    id = get_main_file_id(src_mgr)
    loc = getLocForEndOfFile(src_mgr, id)
    dispose(id)
    return loc
end
