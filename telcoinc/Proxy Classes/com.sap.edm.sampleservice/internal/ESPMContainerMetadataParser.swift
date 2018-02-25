// # Proxy Compiler 17.12.1-7fb011-20180122

import Foundation
import SAPOData

internal class ESPMContainerMetadataParser {
    internal static let options: Int = (CSDLOption.processMixedVersions | CSDLOption.retainOriginalText | CSDLOption.ignoreUndefinedTerms)

    internal static let parsed: CSDLDocument = ESPMContainerMetadataParser.parse()

    static func parse() -> CSDLDocument {
        let parser: CSDLParser = CSDLParser()
        parser.logWarnings = false
        parser.csdlOptions = ESPMContainerMetadataParser.options
        let metadata: CSDLDocument = parser.parseInProxy(ESPMContainerMetadataText.xml, url: "ESPM")
        metadata.proxyVersion = "17.12.1-7fb011-20180122"
        return metadata
    }
}
