part of updater;

/// Updater using github releases.
abstract class GitHubUpdater implements IUpdater {
  /// Updater using github releases.
  @mustCallSuper
  GitHubUpdater() : super();

  /// The API endpoint for the github repository apis.
  static const githubApiUrl = 'https://api.github.com/repos';

  /// The name of the github repository where the app is hosted on.
  String get repo;

  /// The owner of the github [repo].
  String get repoOwner;

  /// The name of the installer file that is downloaded if [Platform.isWindows].
  String get windowsFileName;

  /// The name of the installer file that is downloaded if [Platform.isMacOS].
  String get macFileName;

  /// The name of the installer file that is downloaded if [Platform.isLinux].
  String get linuxFileName;

  String _latestVersion = "";
  String _latestReleaseName = "";
  String _setupDownloadUrl = "";

  /// The url to use for the api call.
  String get repoUrl => "$githubApiUrl/$repoOwner/$repo";

  /// The latest version of the app.
  @nonVirtual
  String get latestVersion => _latestVersion;

  /// The latest release name of the app.
  @nonVirtual
  String get latestVersionName => _latestReleaseName;

  /// The url to download the latest installer from.
  @nonVirtual
  String get setupDownloadUrl => _setupDownloadUrl;

  bool _updateAvailable = false;

  @override
  @nonVirtual
  bool get updateAvailable => _updateAvailable;

  @nonVirtual
  @override
  Future<bool> update() async {
    if (!await connectivity.checkConnection()) {
      error("Could not check for updates, you may be using an outadet version! Please check your internet connection");
      return _updateAvailable = false;
    }

    var client = Client();

    try {
      var fileName = Platform.isWindows
          ? windowsFileName
          : Platform.isMacOS
              ? macFileName
              : linuxFileName;

      var response = await client.get(Uri.parse("$repoUrl/releases/latest"));
      var json = jsonDecode(response.body);
      _latestVersion = json["tag_name"];
      _latestReleaseName = json["name"];

      var asset = json["assets"].firstWhere((asset) => asset["name"] == fileName);
      _setupDownloadUrl = asset["browser_download_url"];

      return _updateAvailable = latestVersion != currentVersion;
    } catch (e) {
      error("Error checking for upates: $e! If this error persists, please let us know by opening an issue on GitHub");

      return _updateAvailable = false;
    }
  }

  @nonVirtual
  @override
  Future<bool> upgrade(void Function(int, int) onProgress) async {
    var dio = Dio();
    var path = "${Directory.systemTemp.path}/$appName - $latestVersionName Setup.exe";
    await dio.download(_setupDownloadUrl, path, onReceiveProgress: onProgress);

    var f = File(path);

    if (await f.exists()) {
      await Process.run(f.path, []);

      exit(0);
    }

    error("Could not download the installer!");

    return false;
  }

  // static final connectivity = Connectivity();
  // static const githubApiUrl = 'https://api.github.com/repos';
  // static const repoOwner = "necodeIT";
  // static const repoName = "lists";
  // static const repoUrl = "$githubApiUrl/$repoOwner/$repoName";

  // static const appName = "Lists";
  // static const version = "1.0.0";
  // static const _versionName = "Beta";
  // static String get versionName => "$_versionName v$version";

  // static var _latestVersion = "";
  // static var _latestReleaseName = "";
  // static var _updateAvailable = false;
  // static var _setupDownloadUrl = "";
  // static var _errorMessage = "";

  // static String get latestVersion => _latestVersion;
  // static String get latestVersionName => _latestReleaseName;
  // static bool get updateAvailable => _updateAvailable;
  // static String get setupDownloadUrl => _setupDownloadUrl;

  // static String getErrorMessage() {
  //   var copy = _errorMessage;
  //   _errorMessage = "";
  //   return copy;
  // }

  // static Future init() async {
  //   _updateAvailable = await update();
  // }

  // /// Check for newer release on github
  // static Future<bool> update() async {
  //   if (!await connectivity.checkConnection()) {
  //     _errorMessage = "Could not check for updates automatically, you may be using an outadet version!\nPlease check your internet connection";
  //     return _updateAvailable = false;
  //   }

  //   var client = Client();

  //   try {
  //     var response = await client.get(Uri.parse("$repoUrl/releases/latest"));
  //     var json = jsonDecode(response.body);
  //     _latestVersion = json["tag_name"];
  //     _latestReleaseName = json["name"];
  //     // get asset download url with name WindowsSetup.exe
  //     var asset = json["assets"].firstWhere((asset) => asset["name"] == "WindowsSetup.exe");
  //     _setupDownloadUrl = asset["browser_download_url"];

  //     return _updateAvailable = latestVersion != version;
  //   } catch (e) {
  //     _errorMessage = "Error checking for upates: $e! If this error persists, please let us know by opening an issue on GitHub";

  //     return _updateAvailable = false;
  //   }
  // }

  // /// Download the setup file to temp folder
  // static Future<String> upgrade(Function(int, int)? onReceiveProgress) async {
  //   var dio = Dio();
  //   var path = "${Directory.systemTemp.path}/$appName - $latestVersionName Setup.exe";
  //   await dio.download(_setupDownloadUrl, path, onReceiveProgress: onReceiveProgress);

  //   return path;
  // }
}
