/*
 * DublinCoreMetadataTest.java
 * JUnit based test
 *
 * Created on 28 septembre 2006, 11:12
 */
package fr.paris.lutece.plugins.document.modules.metadatadublincore.business;

import fr.paris.lutece.test.LuteceTestCase;


/**
 * DublinCore Metadata Test
 */
public class DublinCoreMetadataTest extends LuteceTestCase
{
    private static final String TITLE = "title";
    private static final String CREATOR = "creator";
    private static final String SUBJECT = "subject";
    private static final String DESCRIPTION = "description";
    private static final String PUBLISHER = "publisher";
    private static final String CONTRIBUTOR = "contributor";
    private static final String DATE = "date";
    private static final String TYPE = "type";
    private static final String FORMAT = "format";
    private static final String IDENTIFIER = "identifier";
    private static final String SOURCE = "source";
    private static final String LANGUAGE = "language";
    private static final String RELATION = "relation";
    private static final String COVERAGE = "coverage";
    private static final String RIGTHS = "rigths";

    /**
     * Test of load method, of class fr.paris.lutece.plugins.document.modules.metadatadublincore.business.DublinCoreMetadata.
     */
    public void testLoad(  )
    {
        System.out.println( "load" );

        DublinCoreMetadata instance = new DublinCoreMetadata(  );
        instance.setTitle( TITLE );
        instance.setCreator( CREATOR );
        instance.setSubject( SUBJECT );
        instance.setDescription( DESCRIPTION );
        instance.setPublisher( PUBLISHER );
        instance.setContributor( CONTRIBUTOR );
        instance.setDate( DATE );
        instance.setType( TYPE );
        instance.setFormat( FORMAT );
        instance.setIdentifier( IDENTIFIER );
        instance.setSource( SOURCE );
        instance.setLanguage( LANGUAGE );
        instance.setRelation( RELATION );
        instance.setCoverage( COVERAGE );
        instance.setRights( RIGTHS );

        String strXML = instance.getXml(  );

        DublinCoreMetadata instance2 = new DublinCoreMetadata(  );
        instance2.load( strXML );

        assertEquals( instance.getTitle(  ), instance2.getTitle(  ) );
        assertEquals( instance.getCreator(  ), instance2.getCreator(  ) );
        assertEquals( instance.getSubject(  ), instance2.getSubject(  ) );
        assertEquals( instance.getDescription(  ), instance2.getDescription(  ) );
        assertEquals( instance.getPublisher(  ), instance2.getPublisher(  ) );
        assertEquals( instance.getContributor(  ), instance2.getContributor(  ) );
        assertEquals( instance.getDate(  ), instance2.getDate(  ) );
        assertEquals( instance.getType(  ), instance2.getType(  ) );
        assertEquals( instance.getFormat(  ), instance2.getFormat(  ) );
        assertEquals( instance.getIdentifier(  ), instance2.getIdentifier(  ) );
        assertEquals( instance.getSource(  ), instance2.getSource(  ) );
        assertEquals( instance.getLanguage(  ), instance2.getLanguage(  ) );
        assertEquals( instance.getRelation(  ), instance2.getRelation(  ) );
        assertEquals( instance.getCoverage(  ), instance2.getCoverage(  ) );
        assertEquals( instance.getRights(  ), instance2.getRights(  ) );
    }
}
