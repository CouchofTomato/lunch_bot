module SlackLunchbot
  module LunchBotRefinements
    refine Array do
      def split n
        count , fat_ones = self.size / n , self.size % n
        self.inject( [[]] ) do |a,e|
          a.last.size < count + ( a.size <= fat_ones ? 1 : 0 ) ?
            a.last << e  :  a << [e] ;  a
        end
      end
    end
  end
end
