const Lang = imports.lang;

var PluginStatus = new Lang.Class({
    Name: "PluginStatus",

    _init(code, action, isMalicious, maliciousPart, maliciousDescription) {
        this.code = code;
        this.action = action;
        this.isMalicious = isMalicious;
        this.maliciousPart = maliciousPart;
        this.maliciousDescription = maliciousDescription;
    },

    isPluginEnable() {
        return this.code === 0;
    }
});

var Plugin = new Lang.Class({
    Name: "Plugin",

    _init(name, plugin) {
        this.name = name;
        this.label = plugin.label;
        this.description = plugin.description;
        this.license = plugin.license;
        this.category = plugin.category;
        this.path = plugin.path;
        this.icon = plugin.icon;
        if (typeof plugin.scripts !== "undefined") {
            this.scripts = {
                exec: plugin.scripts.exec,
                undo: plugin.scripts.undo,
                status: plugin.scripts.status
            };
        }
    }
});

var PluginRepository = new Lang.Class({
    Name: "PluginRepository",

    _init(nectar) {
        this.nectar = fedy;
        this.nectar._loadConfig();
        this.nectar._loadPlugins();

        this.plugins = {};
        for (let category in this.nectar._plugins) {
            if (this.nectar._plugins.hasOwnProperty(category)) {
                this._toPlugin(this.nectar._plugins[category]);
                this.plugins = Object.assign({}, this.plugins, this.nectar._plugins[category]);
            }
        }
    },

    listCategories() {
        return Object.keys(this.nectar._plugins).sort();
    },

    listByCategory(category) {
        return Object.values(this.nectar._plugins[category]);
    },

    getByName(pluginName) {
        return this.plugins.hasOwnProperty(pluginName) ? this.plugins[pluginName] : {name: pluginName};
    },

    promiseOfPluginStatus(plugin) {
        return new Promise((resolve) => {
            if (typeof plugin.label === "undefined") {
                resolve(new PluginStatus());
            }

            this.nectar._getPluginStatus(plugin, (action, statusCode) => {
                const [ isMalicious, maliciousPart, description ] = this.nectar._scanMaliciousCommand(plugin, action.command),
                    pluginStatus = new PluginStatus(statusCode, action, isMalicious, maliciousPart, description);
                resolve(pluginStatus);
            });
        });
    },

    promiseOfCommandStatus(path, command) {
        return new Promise((resolve) => {
            this.nectar._queueCommand(path, command, (pid, commandStatusCode) => {
                resolve(commandStatusCode);
            });
        });
    },

    _toPlugin(plugins) {
        Object.keys(plugins)
            .forEach(pluginName => {
                plugins[pluginName] = new Plugin(pluginName, plugins[pluginName]);
            });
    }
});

