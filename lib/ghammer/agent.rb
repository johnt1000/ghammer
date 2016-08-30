class Agent
	attr_accessor :browser
	attr_accessor :os
	attr_accessor :local

	def initialize
    self.browser = get_browser
    self.os = get_os
    self.local = get_local
	end

	def random
		str = String.new
		str.concat self.browser.sample
		str.concat "/#{rand(20)}.#{rand(20)}"
		str.concat " ("
		str.concat "#{self.os.sample} #{rand(7)}.#{rand(9)}; "
		str.concat "#{self.local.sample};"
		str.concat ")"
		str
	end

	def to_s
		random
	end

	private

		def get_browser
			browser = Array.new
			browser.push 'Firefox'
			browser.push 'Safari'
			browser.push 'Opera'
			browser.push 'Flock'
			browser.push 'Internet Explorer'
			browser.push 'Seamonkey'
			browser.push 'Tor Browser'
			browser.push 'GNU IceCat'
			browser.push 'CriOS'
			browser.push 'TenFourFox'
			browser.push 'SeaMonkey'
			browser.push 'B-l-i-t-z-B-O-T'
			browser.push 'Konqueror'
			browser.push 'Mobile'
			browser.push 'Konqueror'
			browser.push 'Netscape'
			browser.push 'Chrome'
			browser.push 'Dragon'
			browser.push 'SeaMonkey'
			browser.push 'Maxthon'
			browser.push 'IBrowse'
			browser.push 'K-Meleon'
			browser.push 'GoogleBot'
			browser.push 'Konqueror'
			browser.push 'Minimo'
			browser.push 'Googlebot'
			browser.push 'WeltweitimnetzBrowser'
			browser.push 'SuperBot'
			browser.push 'TerrawizBot'
			browser.push 'YodaoBot'
			browser.push 'Wyzo'
			browser.push 'Grail'
			browser.push 'PycURL'
			browser.push 'Galaxy'
			browser.push 'EnigmaFox'
			browser.push '008'
			browser.push 'ABACHOBot'
			browser.push 'Bimbot'
			browser.push 'Covario IDS'
			browser.push 'iCab'
			browser.push 'KKman'
			browser.push 'Oregano'
			browser.push 'WorldWideWeb'
			browser.push 'Wyzo'
			browser.push 'GNU IceCat'
			browser.push 'Vimprobable'
			browser.push 'uzbl'
			browser.push 'Slim Browser'
			browser.push 'Flock'
			browser.push 'OmniWeb'
			browser.push 'Rockmelt'
			browser.push 'Shiira'
			browser.push 'Swift'
			browser.push 'Pale Moon'
			browser.push 'Camino'
			browser.push 'Flock'
			browser.push 'Galeon'
			browser.push 'Sylera'

			return browser
		end

		def get_os
			os = Array.new
			os.push 'Windows 3.1'
			os.push 'Windows 95'
			os.push 'Windows 98'
			os.push 'Windows 2000'
			os.push 'Windows NT'
			os.push 'Linux 2.4.22-10mdk'
			os.push 'FreeBSD'
			os.push 'Windows XP'
			os.push 'Windows Vista'
			os.push 'Redhat Linux'
			os.push 'Ubuntu'
			os.push 'Fedora'
			os.push 'AmigaOS'
			os.push 'BackTrack Linux'
			os.push 'iPad'
			os.push 'BlackBerry'
			os.push 'Unix'
			os.push 'CentOS Linux'
			os.push 'Debian Linux'
			os.push 'Macintosh'
			os.push 'Android'
			os.push 'iPhone'
			os.push 'Windows NT 6.1'
			os.push 'BeOS'
			os.push 'OS 10.5'
			os.push 'Nokia'
			os.push 'Arch Linux'
			os.push 'Ark Linux'
			os.push 'BitLinux'
			os.push 'Conectiva (Mandriva)'
			os.push 'CRUX Linux'
			os.push 'Damn Small Linux'
			os.push 'DeLi Linux'
			os.push 'Ubuntu'
			os.push 'BigLinux'
			os.push 'Edubuntu'
			os.push 'Fluxbuntu'
			os.push 'Freespire'
			os.push 'GNewSense'
			os.push 'Gobuntu'
			os.push 'gOS'
			os.push 'Mint Linux'
			os.push 'Kubuntu'
			os.push 'Xubuntu'
			os.push 'ZeVenOS'
			os.push 'Zebuntu'
			os.push 'DemoLinux'
			os.push 'Dreamlinux'
			os.push 'DualOS'
			os.push 'eLearnix'
			os.push 'Feather Linux'
			os.push 'Famelix'
			os.push 'FeniX'
			os.push 'Gentoo'
			os.push 'GoboLinux'
			os.push 'GNUstep'
			os.push 'Insigne Linux'
			os.push 'Kalango'
			os.push 'KateOS'
			os.push 'Knoppix'
			os.push 'Kurumin'
			os.push 'Dizinha'
			os.push 'TupiServer'
			os.push 'Linspire'
			os.push 'Litrix'
			os.push 'Mandrake'
			os.push 'Mandriva'
			os.push 'MEPIS'
			os.push 'Musix GNU Linux'
			os.push 'Musix-BR'
			os.push 'OneBase Go'
			os.push 'openSuSE'
			os.push 'pQui Linux'
			os.push 'PCLinuxOS'
			os.push 'Plaszma OS'
			os.push 'Puppy Linux'
			os.push 'QiLinux'
			os.push 'Red Hat Linux'
			os.push 'Red Hat Enterprise Linux'
			os.push 'CentOS'
			os.push 'Fedora'
			os.push 'Resulinux'
			os.push 'Rxart'
			os.push 'Sabayon Linux'
			os.push 'SAM Desktop'
			os.push 'Satux'
			os.push 'Slackware'
			os.push 'GoblinX'
			os.push 'Slax'
			os.push 'Zenwalk'
			os.push 'SuSE'
			os.push 'Caixa Mágica'
			os.push 'HP-UX'
			os.push 'IRIX'
			os.push 'OSF/1'
			os.push 'OS-9'
			os.push 'POSYS'
			os.push 'QNX'
			os.push 'Solaris'
			os.push 'OpenSolaris'
			os.push 'SunOS'
			os.push 'SCO UNIX'
			os.push 'Tropix'
			os.push 'EROS'
			os.push 'Tru64'
			os.push 'Digital UNIX'
			os.push 'Ultrix'
			os.push 'UniCOS'
			os.push 'UNIflex'
			os.push 'Microsoft Xenix'
			os.push 'z/OS'
			os.push 'Xinu'
			os.push 'Research Unix'
			os.push 'InfernoOS'

			return os
		end

		def get_local
			local = Array.new
			local.push 'cs-CZ'
			local.push 'en-US'
			local.push 'sk-SK'
			local.push 'pt-BR'
			local.push 'sq_AL'
			local.push 'sq'
			local.push 'ar_DZ'
			local.push 'ar_BH'
			local.push 'ar_EG'
			local.push 'ar_IQ'
			local.push 'ar_JO'
			local.push 'ar_KW'
			local.push 'ar_LB'
			local.push 'ar_LY'
			local.push 'ar_MA'
			local.push 'ar_OM'
			local.push 'ar_QA'
			local.push 'ar_SA'
			local.push 'ar_SD'
			local.push 'ar_SY'
			local.push 'ar_TN'
			local.push 'ar_AE'
			local.push 'ar_YE'
			local.push 'ar'
			local.push 'be_BY'
			local.push 'be'
			local.push 'bg_BG'
			local.push 'bg'
			local.push 'ca_ES'
			local.push 'ca'
			local.push 'zh_CN'
			local.push 'zh_HK'
			local.push 'zh_SG'
			local.push 'zh_TW'
			local.push 'zh'
			local.push 'hr_HR'
			local.push 'hr'
			local.push 'cs_CZ'
			local.push 'cs'
			local.push 'da_DK'
			local.push 'da'
			local.push 'nl_BE'
			local.push 'nl_NL'
			local.push 'nl'
			local.push 'en_AU'
			local.push 'en_CA'
			local.push 'en_IN'
			local.push 'en_IE'
			local.push 'en_MT'
			local.push 'en_NZ'
			local.push 'en_PH'
			local.push 'en_SG'
			local.push 'en_ZA'
			local.push 'en_GB'
			local.push 'en_US'
			local.push 'en'
			local.push 'et_EE'
			local.push 'et'
			local.push 'fi_FI'
			local.push 'fi'
			local.push 'fr_BE'
			local.push 'fr_CA'
			local.push 'fr_FR'
			local.push 'fr_LU'
			local.push 'fr_CH'
			local.push 'fr'
			local.push 'de_AT'
			local.push 'de_DE'
			local.push 'de_LU'
			local.push 'de_CH'
			local.push 'de'
			local.push 'el_CY'
			local.push 'el_GR'
			local.push 'el'
			local.push 'iw_IL'
			local.push 'iw'
			local.push 'hi_IN'
			local.push 'hu_HU'
			local.push 'hu'
			local.push 'is_IS'
			local.push 'is'
			local.push 'in_ID'
			local.push 'in'
			local.push 'ga_IE'
			local.push 'ga'
			local.push 'it_IT'
			local.push 'it_CH'
			local.push 'it'
			local.push 'ja_JP'
			local.push 'ja_JP_JP'
			local.push 'ja'
			local.push 'ko_KR'
			local.push 'ko'
			local.push 'lv_LV'
			local.push 'lv'
			local.push 'lt_LT'
			local.push 'lt'
			local.push 'mk_MK'
			local.push 'mk'
			local.push 'ms_MY'
			local.push 'ms'
			local.push 'mt_MT'
			local.push 'mt'
			local.push 'no_NO'
			local.push 'no_NO_NY'
			local.push 'no'
			local.push 'pl_PL'
			local.push 'pl'
			local.push 'pt_PT'
			local.push 'pt'
			local.push 'ro_RO'
			local.push 'ro'
			local.push 'ru_RU'
			local.push 'ru'
			local.push 'sr_BA'
			local.push 'sr_ME'
			local.push 'sr_CS'
			local.push 'sr_RS'
			local.push 'sr'
			local.push 'sk_SK'
			local.push 'sk'
			local.push 'sl_SI'
			local.push 'sl'
			local.push 'es_AR'
			local.push 'es_BO'
			local.push 'es_CL'
			local.push 'es_CO'
			local.push 'es_CR'
			local.push 'es_DO'
			local.push 'es_EC'
			local.push 'es_SV'
			local.push 'es_GT'
			local.push 'es_HN'
			local.push 'es_MX'
			local.push 'es_NI'
			local.push 'es_PA'
			local.push 'es_PY'
			local.push 'es_PE'
			local.push 'es_PR'
			local.push 'es_ES'
			local.push 'es_US'
			local.push 'es_UY'
			local.push 'es_VE'
			local.push 'es'
			local.push 'sv_SE'
			local.push 'sv'
			local.push 'th_TH'
			local.push 'th_TH_TH'
			local.push 'th'
			local.push 'tr_TR'
			local.push 'tr'
			local.push 'uk_UA'
			local.push 'uk'
			local.push 'vi_VN'
			local.push 'vi'

			return local
		end
end