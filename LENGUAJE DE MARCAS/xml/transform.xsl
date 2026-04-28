<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="/">
        <html>
            <head>
                <title>Reporte de Reservas - IT Alex Academy</title>
                <link rel="stylesheet" href="style.css"/>
            </head>
            <body>
                <h1>Panel de Control de Aulas</h1>
                <p>Fecha de generación: 2026-04-26</p>
                
                <h2>Listado de Reservas Confirmadas</h2>
                <table>
                    <tr>
                        <th>Curso</th>
                        <th>Fecha</th>
                        <th>Aula</th>
                        <th>Estado</th>
                    </tr>
                    <xsl:for-each select="academia/reservas/reserva[estado='Confirmada']">
                        <tr>
                            <td><xsl:value-of select="curso"/></td>
                            <td><xsl:value-of select="horario/@fecha"/></td>
                            <td><xsl:value-of select="@ref_aula"/></td>
                            <td class="confirmada"><xsl:value-of select="estado"/></td>
                        </tr>
                    </xsl:for-each>
                </table>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>