--
--  CustomDocument.applescript
--  Sbc Bitpool Expander
--
--  Created by Alexander A. Kropotin on 12.11.2020.
--  
--

script CustomDocument
	property parent : class "NSDocument"
	
	on init()
		continue init()
		
		-- Add your subclass-specific initialization here.
		-- If an error occurs here, return missing value.
		
		return me
	end init
	
	on windowNibName()
		-- Override returning the nib file name of the document
		-- If you need to use a subclass of NSWindowController or if your document supports multiple NSWindowControllers, you should remove this method and override -makeWindowControllers instead.
		return "CustomDocument"
	end windowNibName
	
	on dataOfType_error_(typeName, outError)
		
		-- Insert code here to write your document to data of the specified type. If the given outError is not missing value, ensure that you set contents of outError when returning missing value.
		
		-- You can also choose to override -fileWrapperOfType:error:, -writeToURL:ofType:error:, or -writeToURL:ofType:forSaveOperation:originalContentsURL:error: instead.
        set succeeded to false
        if not succeeded and outError is not missing value then
            set contents of outError to current application's NSError's errorWithDomain_code_userInfo_(current application's NSCocoaErrorDomain, current application's NSFileWriteUnknownError, missing value)
        end if
        
        -- Return your document's contents as data, or missing value if there was an error.
		return missing value
	end dataOfType_error_
	
	on readFromData_ofType_error_(theData, typeName, outError)
		
		-- Insert code here to read your document from the given data of the specified type. If the given outError is not missing value, ensure that you set contents of outError when returning false.
		
		-- You can also choose to override -readFromFileWrapper:ofType:error: or -readFromURL:ofType:error: instead.
        
        -- Return true if successful or false if there was an error.
        set succeeded to false
        if not succeeded and outError is not missing value then
            set contents of outError to current application's NSError's errorWithDomain_code_userInfo_(current application's NSCocoaErrorDomain, current application's NSFileReadUnknownError, missing value)
        end if
        return encounteredError
	end readFromData_ofType_error_
    
    on autosavesInPlace()
        -- Return true if you wish to support autosaving and versions, false if you do not.
        return true
    end autosavesInPlace
    
end script
