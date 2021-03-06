cask 'teamviewer' do
  version :latest
  sha256 :no_check

  url 'https://download.teamviewer.com/download/TeamViewer.dmg'
  name 'TeamViewer'
  homepage 'https://www.teamviewer.com/'

  auto_updates true

  pkg 'Install TeamViewer.pkg'

  uninstall pkgutil:   'com.teamviewer.*',
            launchctl: 'com.teamviewer.service',
            delete:    [
                         '/Applications/TeamViewer.app',
                         '/Library/LaunchAgents/com.teamviewer.teamviewer_desktop.plist',
                         '/Library/LaunchAgents/com.teamviewer.teamviewer.plist',
                         '/Library/LaunchDaemons/com.teamviewer.Helper.plist',
                         '/Library/LaunchDaemons/com.teamviewer.teamviewer_service.plist',
                       ]

  zap       delete: [
                      '~/Library/Caches/com.teamviewer.TeamViewer',
                      '~/Library/Logs/TeamViewer',
                    ]
end
