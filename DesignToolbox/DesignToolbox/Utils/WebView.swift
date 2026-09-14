// Software: MISO iOS (demo app) (fork of OUDS iOS Design System Toolbox)
// SPDX-License-Identifier: MIT
// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne

#if os(iOS)
import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {

    enum ContentSource {
        case url(URL)
        case html(String)
    }

    let source: ContentSource

    init(from url: URL) {
        source = .url(url)
    }

    // MARK: UIViewRepresentable

    @MainActor
    func makeUIView(context: Context) -> WKWebView {
        WKWebView()
    }

    @MainActor
    func updateUIView(_ webView: WKWebView, context: Context) {
        switch source {
        case let .url(url):
            let request = URLRequest(url: url)
            webView.load(request)
        case let .html(string):
            webView.loadHTMLString(string, baseURL: nil)
        }
    }
}

#elseif os(macOS)
import AppKit
import SwiftUI
import WebKit

struct WebView: NSViewRepresentable {
    enum ContentSource {
        case url(URL)
        case html(String)
    }

    let source: ContentSource

    init(from url: URL) {
        source = .url(url)
    }

    init(html: String) {
        source = .html(html)
    }

    // MARK: NSViewRepresentable

    @MainActor
    func makeNSView(context: Context) -> WKWebView {
        let webView = WKWebView()
        return webView
    }

    @MainActor
    func updateNSView(_ webView: WKWebView, context: Context) {
        switch source {
        case let .url(url):
            let request = URLRequest(url: url)
            webView.load(request)
        case let .html(string):
            webView.loadHTMLString(string, baseURL: nil)
        }
    }
}
#endif
