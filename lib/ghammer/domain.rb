# encoding: UTF-8

class Domain
	attr_accessor :url
	attr_accessor :protocol

	def initialize
    self.url = get_url
    self.protocol = 'https'
	end

	def random
		str = String.new
		str.concat "#{self.protocol}://"
		str.concat self.url.sample.downcase
		str
	end

	def to_s
		random
	end

	private

		def get_url
			url = Array.new
			url.push 'www.google.com'
			url.push 'www.google.ac'
			url.push 'www.google.com.om'
			url.push 'www.google.ad'
			url.push 'www.google.ae'
			url.push 'www.google.com.af'
			url.push 'www.google.com.ag'
			url.push 'www.google.com.ai'
			url.push 'www.google.am'
			url.push 'www.google.it.ao'
			url.push 'www.google.com.ar'
			url.push 'www.google.cat'
			url.push 'www.google.as'
			url.push 'www.google.at'
			url.push 'www.google.com.au'
			url.push 'www.google.az'
			url.push 'www.google.ba'
			url.push 'www.google.com.bd'
			url.push 'www.google.be'
			url.push 'www.google.bf'
			url.push 'www.google.bg'
			url.push 'www.google.com.bh'
			url.push 'www.google.bi'
			url.push 'www.google.bj'
			url.push 'www.google.com.bn'
			url.push 'www.google.com.bo'
			url.push 'www.google.com.br'
			url.push 'www.google.bs'
			url.push 'www.google.co.bw'
			url.push 'www.google.com.by'
			url.push 'www.google.com.bz'
			url.push 'www.google.ca'
			url.push 'www.google.com.kh'
			url.push 'www.google.cc'
			url.push 'www.google.cd'
			url.push 'www.google.cf'
			url.push 'www.google.cn'
			url.push 'www.google.com.co'
			url.push 'www.google.co.nz'
			url.push 'www.google.cg'
			url.push 'www.google.ch'
			url.push 'www.google.ci'
			url.push 'www.google.co.ck'
			url.push 'www.google.cl'
			url.push 'www.google.cm'
			url.push 'www.google.co.cr'
			url.push 'www.google.com.cu'
			url.push 'www.google.cv'
			url.push 'www.google.cz'
			url.push 'www.google.de'
			url.push 'www.google.nu'
			url.push 'www.google.dj'
			url.push 'www.google.dk'
			url.push 'www.google.dm'
			url.push 'www.google.com.do'
			url.push 'www.google.dz'
			url.push 'www.google.no'
			url.push 'www.google.com.ec'
			url.push 'www.google.ee'
			url.push 'www.google.com.eg'
			url.push 'www.google.es'
			url.push 'www.google.com.et'
			url.push 'www.google.com.np'
			url.push 'www.google.fi'
			url.push 'www.google.com.fj'
			url.push 'www.google.fm'
			url.push 'www.google.fr'
			url.push 'www.google.ga'
			url.push 'www.google.nl'
			url.push 'www.google.ge'
			url.push 'www.google.gf'
			url.push 'www.google.gg'
			url.push 'www.google.com.gh'
			url.push 'www.google.com.gi'
			url.push 'www.google.nr'
			url.push 'www.google.gl'
			url.push 'www.google.gm'
			url.push 'www.google.gp'
			url.push 'www.google.gr'
			url.push 'www.google.com.gt'
			url.push 'www.google.com.ni'
			url.push 'www.google.gy'
			url.push 'www.google.com.hk'
			url.push 'www.google.hn'
			url.push 'www.google.hr'
			url.push 'www.google.ht'
			url.push 'www.google.com.ng'
			url.push 'www.google.hu'
			url.push 'www.google.co.id'
			url.push 'www.google.iq'
			url.push 'www.google.ie'
			url.push 'www.google.co.il'
			url.push 'www.google.com.nf'
			url.push 'www.google.im'
			url.push 'www.google.co.in'
			url.push 'www.google.io'
			url.push 'www.google.is'
			url.push 'www.google.it'
			url.push 'www.google.ne'
			url.push 'www.google.je'
			url.push 'www.google.com.jm'
			url.push 'www.google.jo'
			url.push 'www.google.co.jp'
			url.push 'www.google.co.ke'
			url.push 'www.google.com.na'
			url.push 'www.google.ki'
			url.push 'www.google.kg'
			url.push 'www.google.co.kr'
			url.push 'www.google.com.kw'
			url.push 'www.google.kz'
			url.push 'www.google.co.mz'
			url.push 'www.google.la'
			url.push 'www.google.com.lb'
			url.push 'www.google.com.lc'
			url.push 'www.google.li'
			url.push 'www.google.lk'
			url.push 'www.google.com.my'
			url.push 'www.google.co.ls'
			url.push 'www.google.lt'
			url.push 'www.google.lu'
			url.push 'www.google.lv'
			url.push 'www.google.com.ly'
			url.push 'www.google.com.mx'
			url.push 'www.google.co.ma'
			url.push 'www.google.md'
			url.push 'www.google.me'
			url.push 'www.google.mg'
			url.push 'www.google.mk'
			url.push 'www.google.mw'
			url.push 'www.google.ml'
			url.push 'www.google.mn'
			url.push 'www.google.ms'
			url.push 'www.google.com.mt'
			url.push 'www.google.mu'
			url.push 'www.google.mv'
			url.push 'www.google.com.pa'
			url.push 'www.google.com.pe'
			url.push 'www.google.com.ph'
			url.push 'www.google.com.pk'
			url.push 'www.google.pn'
			url.push 'www.google.com.pr'
			url.push 'www.google.ps'
			url.push 'www.google.pt'
			url.push 'www.google.com.py'
			url.push 'www.google.com.qa'
			url.push 'www.google.ro'
			url.push 'www.google.rs'
			url.push 'www.google.ru'
			url.push 'www.google.rw'
			url.push 'www.google.com.sa'
			url.push 'www.google.com.sb'
			url.push 'www.google.sc'
			url.push 'www.google.se'
			url.push 'www.google.com.sg'
			url.push 'www.google.sh'
			url.push 'www.google.si'
			url.push 'www.google.sk'
			url.push 'www.google.com.sl'
			url.push 'www.google.sn'
			url.push 'www.google.sm'
			url.push 'www.google.so'
			url.push 'www.google.st'
			url.push 'www.google.com.sv'
			url.push 'www.google.td'
			url.push 'www.google.tg'
			url.push 'www.google.co.th'
			url.push 'www.google.tk'
			url.push 'www.google.tl'
			url.push 'www.google.tm'
			url.push 'www.google.to'
			url.push 'www.google.com.tn'
			url.push 'www.google.com.tr'
			url.push 'www.google.tt'
			url.push 'www.google.com.tw'
			url.push 'www.google.co.tz'
			url.push 'www.google.com.ua'
			url.push 'www.google.co.ug'
			url.push 'www.google.co.uk'
			url.push 'www.google.us'
			url.push 'www.google.com.uy'
			url.push 'www.google.co.uz'
			url.push 'www.google.com.vc'
			url.push 'www.google.co.ve'
			url.push 'www.google.vg'
			url.push 'www.google.co.vi'
			url.push 'www.google.com.vn'
			url.push 'www.google.vu'
			url.push 'www.google.ws'
			url.push 'www.google.co.za'
			url.push 'www.google.co.zm'
			url.push 'www.google.co.zw'

			return url
		end
end